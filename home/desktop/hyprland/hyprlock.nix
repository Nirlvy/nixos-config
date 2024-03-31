{ lib
, stdenv
, fetchFromGitHub
, cmake
, ninja
, wayland
, cairo
, pango
, pam
, libxkbcommon
, libglvnd
, libdrm
, mesa
, wayland-protocols
, xorgproto
, ...
} @ args:

stdenv.mkDerivation rec {
  pname = "hyprlock";
  version = "0.1.0.r70.59997a7";
  src = fetchFromGitHub ({
    owner = "hyprwm";
    repo = "hyprlock";
    rev = "0.1.0.r70.59997a7";
    fetchSubmodules = false;
    # sha256 = "sha256-NyT5CpQeclSJ0b4Qr4McAJXwKgy6SWiUijkAgu6TTNM=";
  });

  enableParallelBuilding = true;
  dontFixCmake = true;

  # nativeBuildInputs 指定的是只有在构建时用到，运行时不会用到的软件包
  # 例如这里的用来生成 Makefile 的 CMake，和用来生成配置文件的 Python
  nativeBuildInputs = [
    cmake
    # 向打包环境加入 Python 和这几个包，preConfigure 中的命令需要用到
    (python3.withPackages (p: with p; [ jinja2 pyyaml tabulate ]))
  ];

  # buildInputs 指定的是运行时也会用到的软件包
  buildInputs = [
    liboqs
    openssl_3_0
  ];

  # 在配置步骤（Configure phase）之前运行的命令，用来启用所有的后量子加密算法
  preConfigure = ''
    cp ${sources.openssl-oqs.src}/oqs-template/generate.yml oqs-template/generate.yml
    sed -i "s/enable: false/enable: true/g" oqs-template/generate.yml
    LIBOQS_SRC_DIR=${sources.liboqs.src} python oqs-template/generate.py
  '';

  cmakeFlags = [ "-DCMAKE_BUILD_TYPE=Release" ];

  # 手动指定安装命令，把 oqsprovider.so 复制到 $out/lib 文件夹下
  # 一般来说可执行文件放在 $out/bin，库文件放在 $out/lib，菜单图标等放在 $out/share
  # 但并非强制，你在 $out 下随便放都可以，只不过在其它地方调用会麻烦一些
  installPhase = ''
    mkdir -p $out/lib
    install -m755 oqsprov/oqsprovider.so "$out/lib"
  '';
}
