{
  home.file = {
    ".condarc".text = ''
      channels:
        - defaults
        - conda-forge
      show_channel_urls: true
      default_channels:
        - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main
        - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/r
        - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/msys2
      custom_channels:
        conda-forge: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
        msys2: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
        bioconda: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
        menpo: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
        pytorch: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
        pytorch-lts: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
        simpleitk: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
    '';

    ".mambarc".text = ''
      channels:
        - defaults
        - conda-forge
      show_channel_urls: true
      default_channels:
        - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main
        - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/r
        - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/msys2
      custom_channels:
        conda-forge: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
        msys2: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
        bioconda: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
        menpo: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
        pytorch: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
        pytorch-lts: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
        simpleitk: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
    '';

    ".npmrc".text = ''
      registry=https://registry.npmmirror.com
    '';

  };

  xdg.configFile = {
    "mako/config".text = ''
      text-color=#dedede
      background-color=#383c4a
      border-color=#8db5ca
      default-timeout=5000
      font=Noto Sans CJK SC 12
      border-radius=8
      border-size=2
      width=350
      height=300
      anchor=top-right
      text-alignment=center
      padding=18

      [urgency=high]
      border-color=#4f6580
      default-timeout=0
      border-size=5
      layer=overlay

      [mode=dnd]
      invisible=1
    '';

    "nix/nix.conf".text = ''
      experimental-features = nix-command flakes 
    '';

    "nixpkgs/config.nix".text = ''
      { allowUnfree = true; }
    '';

    "pip/pip.conf".text = ''
      [global]
      index-url = https://mirrors.ustc.edu.cn/pypi/web/simple
      format = columns
    '';

    "xfce4/helpers.rc".text = ''
      TerminalEmulator=kitty
    '';
  };
}
