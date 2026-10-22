{ pkgs, ... }:
{
  programs.clash-verge = {
    enable = true;
    autoStart = true;
    tunMode = true;
    serviceMode = true;
    group = "users";
  };

  # Verge overwrites TUN fields from Merge/Script with its own mutable settings.
  home-manager.users.nirlvy = { config, lib, ... }: {
    home.activation.clashVergeEasyTierBypass = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      ${pkgs.python3.withPackages (ps: [ ps.pyyaml ])}/bin/python3 - <<'PY'
      from pathlib import Path
      import yaml

      path = Path("${config.xdg.dataHome}") / "io.github.clash-verge-rev.clash-verge-rev/config.yaml"
      path.parent.mkdir(parents=True, exist_ok=True)
      original = path.read_text() if path.exists() else ""
      settings = yaml.safe_load(original) or {}
      tun = settings.setdefault("tun", {})
      excluded = tun.setdefault("route-exclude-address", [])
      # NH currently uses this subnet; update it if the DHCP subnet changes.
      subnet = "10.126.126.0/24"
      if subnet not in excluded:
          excluded.append(subnet)
          if path.exists():
              path.with_name("config.yaml.before-easytier").write_text(original)
          path.write_text(yaml.safe_dump(settings, allow_unicode=True, sort_keys=False))
      PY
    '';
  };
}
