{pkgs, ...}: {
  programs.neovim = {
    enable = true;

    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    withNodeJs = false;
    withPython3 = false;
    withRuby = false;
  };

  programs.git.enable = true;
  programs.less.enable = true;

  # SSH settings
  programs.ssh.enableAskPassword = false;

  environment.variables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    PAGER = "less";
  };

  environment.systemPackages = with pkgs; [
    curl
    fd
    nfs-utils
    ripgrep
    tree
    unzip
    wget
    zip
  ];
}
