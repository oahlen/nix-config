{
  nixos-modules,
  pkgs,
  ...
}: {
  imports = [
    "${nixos-modules}/programs/neovim"
  ];

  environment.variables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    PAGER = "less";
  };

  programs = {
    git.enable = true;
    less.enable = true;

    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
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
