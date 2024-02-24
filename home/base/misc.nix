{

  xdg.configFile.".condarc".text = ''
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

  xdg.configFile.".npmrc".text = ''
    registry=https://registry.npm.taobao.org/
    disturl=https://npm.taobao.org/dist
    electron_mirror=https://npm.taobao.org/mirrors/electron/
    sass_binary_site=https://npm.taobao.org/mirrors/node-sass/
    phantomjs_cdnurl=https://npm.taobao.org/mirrors/phantomjs/
  '';

}
