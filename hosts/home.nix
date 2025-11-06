{
  buildEnv,
  extraPackages ? [ ],
  pkgs,
}:
buildEnv {
  name = "environment";
  paths =
    with pkgs;
    [
      bat
      bat-extras.batman
      bottom
      dogdns
      dos2unix
      dust
      eza
      fd
      figlet
      fish
      fzf
      gitui
      hexyl
      homage
      huevim
      jless
      jq
      nh
      nixfmt-tree
      nix-prefetch-git
      nix-tree
      nixvim
      npins
      pokeget-rs
      procs
      rage
      rebuild
      ripgrep
      scooter
      sd
      statix
      stylua
      tmux
      tmuxp
      tokei
      typos
      yazi-unwrapped # Wrapped variant includes a lot of bloat
      zoxide
    ]
    ++ extraPackages;

  pathsToLink = [
    "/share/man"
    "/share/doc"
    "/bin"
  ];
  extraOutputsToInstall = [
    "man"
    "doc"
  ];
}
