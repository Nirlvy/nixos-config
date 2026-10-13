#!/usr/bin/env python3
"""Keep flake inputs and pkgs/ up to date.

    python3 scripts/update-pkgs.py --dry-run     # show what would change
    python3 scripts/update-pkgs.py               # apply
    python3 scripts/update-pkgs.py ttf-wps-fonts # only this package

Two maintenance jobs:

  * flake inputs   -> `nix flake update` (flake.lock: nixpkgs, home-manager,
                      xwayland-satellite, noctalia, ...)
  * pkgs/ packages -> bump the revision/release and let nix recompute the hash

Hashes are *never* computed by hand or with nix-prefetch-url: fetchFromGitHub
and fetchzip hash the unpacked tree with their own rules, so a hand-computed
value silently differs. Instead `probe_hash` writes a bogus hash, lets nix
build the fixed-output derivation, and reads the real value out of the mismatch
error. That is slower but always matches what the derivation actually wants.
"""

from __future__ import annotations

import argparse
import json
import re
import subprocess
import sys
import time
import urllib.error
import urllib.request
from pathlib import Path

REPO = Path(__file__).resolve().parent.parent
SYSTEM = "x86_64-linux"
PLACEHOLDER_HASH = "sha256-" + "A" * 43 + "="


# ---------------------------------------------------------------------------
# helpers
# ---------------------------------------------------------------------------


def sh(cmd: list[str], *, attempts: int = 3) -> str:
    """Run a command, retrying transient network failures."""
    proc = None
    for attempt in range(attempts):
        proc = subprocess.run(cmd, capture_output=True, text=True)
        if proc.returncode == 0:
            return proc.stdout.strip()
        if attempt + 1 < attempts:
            sys.stderr.write(f"retrying ({attempt + 1}/{attempts}): {' '.join(cmd)}\n")
            time.sleep(5)
    sys.stderr.write(f"command failed: {' '.join(cmd)}\n{proc.stderr}")
    raise SystemExit(proc.returncode)


def github_head_sha(owner: str, repo: str) -> str:
    """Default-branch head via the API (git ls-remote is often blocked)."""
    try:
        with urllib.request.urlopen(
            f"https://api.github.com/repos/{owner}/{repo}/commits?per_page=1", timeout=30
        ) as resp:
            return json.load(resp)[0]["sha"]
    except (urllib.error.HTTPError, urllib.error.URLError, TimeoutError, IndexError, KeyError) as err:
        sys.stderr.write(f"warning: cannot resolve {owner}/{repo} head: {err}\n")
        return ""


def github_latest_tag(owner: str, repo: str) -> str:
    try:
        with urllib.request.urlopen(
            f"https://api.github.com/repos/{owner}/{repo}/releases/latest", timeout=30
        ) as resp:
            tag = json.load(resp).get("tag_name", "")
        if tag:
            return tag
    except (urllib.error.HTTPError, urllib.error.URLError, TimeoutError):
        pass  # rate limited or no releases; fall back to the tag list
    try:
        with urllib.request.urlopen(
            f"https://api.github.com/repos/{owner}/{repo}/tags?per_page=100", timeout=30
        ) as resp:
            tags = [entry["name"] for entry in json.load(resp)]
    except (urllib.error.HTTPError, urllib.error.URLError, TimeoutError) as err:
        sys.stderr.write(f"warning: cannot list tags of {owner}/{repo}: {err}\n")
        return ""
    return sorted(tags)[-1] if tags else ""


def eval_expr(attr: str) -> str:
    """Expression that resolves an attribute of the repo's package set."""
    return (
        f"let f = {flake_ref()};"
        f" base = import f.inputs.nixpkgs {{ system = \"{SYSTEM}\"; config.allowUnfree = true; }};"
        " overlays = import (f.outPath + \"/overlays\") { inherit (f) inputs; };"
        " p = base.extend (base.lib.composeManyExtensions overlays);"
        f" in p.{attr}"
    )


def flake_ref() -> str:
    """Nix expression for this checkout, wherever the runner placed it."""
    return f"builtins.getFlake (toString (builtins.toPath {json.dumps(str(REPO))}))"


def patch(path: Path, pattern: str, replacement: str, *, dry: bool) -> bool:
    """Replace the single match of `pattern`. Returns True if it changed."""
    text = path.read_text()
    new, n = re.subn(pattern, replacement, text)
    if n != 1:
        sys.stderr.write(f"{path}: pattern matched {n} times: {pattern!r}\n")
        raise SystemExit(1)
    if new == text:
        return False
    if not dry:
        path.write_text(new)
    return True


def set_field(path: Path, field: str, value: str, *, dry: bool) -> bool:
    return patch(path, rf'({re.escape(field)} = ")[^"]+(")', rf"\g<1>{value}\g<2>", dry=dry)


def nix_hash(expr: str, label: str) -> str | None:
    proc = subprocess.run(
        ["nix", "build", "--no-link", "--impure", "--expr", expr],
        capture_output=True,
        text=True,
    )
    combined = proc.stdout + proc.stderr
    match = re.search(r"got:\s+(sha256-[A-Za-z0-9+/=]+)", combined)
    if match:
        return match.group(1)
    sys.stderr.write(f"warning: {label}: no hash in nix output (network?)\n{combined[-2000:]}")
    return None


def probe_hash(package: str, path: Path, field: str) -> str | None:
    """Probe a fetch hash and restore the file, including during dry-run."""
    original = path.read_text()
    try:
        set_field(path, field, PLACEHOLDER_HASH, dry=False)
        return nix_hash(eval_expr(package), package)
    finally:
        path.write_text(original)


def bump_revision(
    package: str, filename: str, owner: str, repo: str, *, hash_field: str, dry: bool
) -> list[str]:
    """Revision-tracking package: move rev to head, then refresh the hash.

    Refresh the hash even when the revision did not move, since upstream can
    replace source archives without changing the commit.
    """
    path = REPO / filename
    changed: list[str] = []

    sha = github_head_sha(owner, repo)
    if sha and patch(path, r'(rev = ")[^"]+(")', rf"\g<1>{sha}\g<2>", dry=dry):
        changed.append(f"{package} rev -> {sha[:8]}")

    new_hash = probe_hash(package, path, hash_field)
    if new_hash is None:
        sys.stderr.write(f"warning: {package}: no hash reported, skipping\n")
        return changed
    if set_field(path, hash_field, new_hash, dry=dry):
        changed.append(f"{package} {hash_field} -> {new_hash[:24]}...")
    return changed


# ---------------------------------------------------------------------------
# packages
# ---------------------------------------------------------------------------

MAPLE_VARIANTS = [
    "NF-NR-NL-HT", "NF-NR-NL-XX", "NF-NR-XX-HT", "NF-NR-XX-XX",
    "NF-XX-NL-HT", "NF-XX-NL-XX", "NF-XX-XX-HT", "NF-XX-XX-XX",
    "XX-NR-NL-HT", "XX-NR-NL-XX", "XX-NR-XX-HT", "XX-NR-XX-XX",
    "XX-XX-NL-HT", "XX-XX-NL-XX", "XX-XX-XX-HT", "XX-XX-XX-XX",
]


def maple_refresh_all_hashes(*, dry: bool) -> list[str]:
    """Recompute every variant hash (upstream re-uploads assets for a tag).

    Only needed when a build says the default hash is stale; each variant costs
    one ~150 MB download.
    """
    path = REPO / "pkgs/jetbrains-maple-mono/default.nix"
    version = re.search(r'version = "([^"]+)"', path.read_text()).group(1)
    changed = []
    for variant in MAPLE_VARIANTS:
        # Fetch the variant by temporarily pointing the default field at it is
        # not possible, so fetch each variant's asset directly through a tiny
        # throwaway expression instead.
        expr = (
            f"let f = {flake_ref()}; pkgs = f.inputs.nixpkgs"
            f".legacyPackages.{SYSTEM}; in pkgs.fetchzip {{"
            f' url = "https://github.com/SpaceTimee/Fusion-JetBrainsMapleMono/releases/download/{version}/JetBrainsMapleMono-{variant}.zip";'
            ' sha256 = "' + PLACEHOLDER_HASH + '"; stripRoot = false; }'
        )
        new_hash = nix_hash(expr, f"maple[{variant}]")
        if new_hash and set_field(path, variant, new_hash, dry=dry):
            changed.append(f"jetbrains-maple-mono[{variant}]")
    return changed


def update_maple(*, dry: bool) -> list[str]:
    """Bump the release tag and re-probe the default variant's hash.

    The other 15 variants are only touched by --refresh-maple-hashes.
    """
    path = REPO / "pkgs/jetbrains-maple-mono/default.nix"
    original = path.read_text()
    old = re.search(r'version = "([^"]+)"', original).group(1)
    new = github_latest_tag("SpaceTimee", "Fusion-JetBrainsMapleMono") or old
    changed = []
    if new != old:
        # Probe against the new release in both normal and dry-run modes.
        set_field(path, "version", new, dry=False)
        changed.append(f"jetbrains-maple-mono {old} -> {new}")
    try:
        new_hash = probe_hash("jetbrains-maple-mono", path, "XX-XX-XX-XX")
    finally:
        if dry:
            path.write_text(original)
    if new_hash and set_field(path, "XX-XX-XX-XX", new_hash, dry=dry):
        changed.append("jetbrains-maple-mono[XX-XX-XX-XX]")
    return changed


REVISION_PACKAGES = {
    "waydroid_script": ("pkgs/waydroid_script/default.nix", "casualsnek", "waydroid_script", "hash"),
    "sddm-sugar-candy": ("pkgs/sddm-sugar-candy/default.nix", "Kangie", "sddm-sugar-candy", "sha256"),
    "StarRailGrubThemes-firefly": (
        "pkgs/StarRailGrubThemes-firefly/default.nix", "voidlhf", "StarRailGrubThemes", "hash"
    ),
    "ttf-wps-fonts": ("pkgs/ttf-wps-fonts/default.nix", "ferion11", "ttf-wps-fonts", "sha256"),
}

# Not automated: pkgs/anime4k (fetchzip release asset, version lives in the
# URL), pkgs/delance (sourcehut), pkgs/resources (hand-made blobs),
# pkgs/aris-plymouth and pkgs/wl-shot-edit (no upstream version).


# ---------------------------------------------------------------------------


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("only", nargs="*", help="limit to these package names")
    parser.add_argument("--dry-run", action="store_true")
    parser.add_argument("--no-flake-update", action="store_true")
    parser.add_argument(
        "--refresh-maple-hashes",
        action="store_true",
        help="recompute all 16 jetbrains-maple-mono variant hashes (~2.4 GB)",
    )
    args = parser.parse_args()

    changed: list[str] = []

    if args.refresh_maple_hashes:
        print("== jetbrains-maple-mono: all variant hashes")
        changed += maple_refresh_all_hashes(dry=args.dry_run)
    else:
        if not args.no_flake_update:
            print("== nix flake update")
            if not args.dry_run:
                sh(["nix", "flake", "update"])
            changed.append("flake.lock")

        package_names = ("jetbrains-maple-mono", *REVISION_PACKAGES)
        for name in args.only or package_names:
            if name not in package_names:
                parser.error(f"unknown package: {name}")
            print(f"== {name}")
            if name == "jetbrains-maple-mono":
                changed += update_maple(dry=args.dry_run)
            else:
                filename, owner, repo, hash_field = REVISION_PACKAGES[name]
                changed += bump_revision(
                    name, filename, owner, repo, hash_field=hash_field, dry=args.dry_run
                )

    if changed:
        print("\nchanged:")
        for item in changed:
            print(f"  {item}")
    else:
        print("\nnothing to update")
    return 0


if __name__ == "__main__":
    sys.exit(main())
