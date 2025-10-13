{
  nixos-modules,
  pkgs,
  ...
}: {
  imports = [
    "${nixos-modules}/programs/direnv"
    "${nixos-modules}/programs/neovim"
  ];

  programs.git.enable = true;
  programs.less.enable = true;

  environment.variables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    PAGER = "less";
  };

  environment.systemPackages = with pkgs; [
    bat
    bat-extras.batman
    bottom
    calc
    curl
    dogdns
    dos2unix
    du-dust
    eza
    fastfetch
    fd
    figlet
    fish
    fzf
    gitui
    hexyl
    jless
    jq
    nfs-utils
    nix-prefetch-git
    nix-search-cli
    nix-tree
    pokeget-rs
    procs
    rage
    ripgrep
    scooter
    sd
    stow
    tmux
    tmuxp
    tokei
    tree
    unzip
    wget
    xdg-user-dirs
    yazi
    zip
    zoxide
  ];
}
