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

  environment.variables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    PAGER = "less";
  };

  environment.systemPackages = with pkgs; [
    bottom
    calc
    curl
    dogdns
    dos2unix
    du-dust
    fd
    figlet
    hexyl
    jless
    nfs-utils
    pokeget-rs
    procs
    rage
    ripgrep
    scooter
    sd
    tokei
    tree
    unzip
    wget
    zip
  ];
}
