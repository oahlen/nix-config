{
  config,
  lib,
  packages,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.modules.development;
in
{
  options.modules.development = {
    enable = mkEnableOption "Whether to enable development support.";
  };

  config = mkIf cfg.enable {
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

    environment.systemPackages =
      with pkgs;
      [
        bat
        bat-extras.batman
        bottom
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
        nixfmt-tree
        nix-prefetch-git
        nix-search-cli
        nix-tree
        npins
        pokeget-rs
        procs
        rage
        ripgrep
        scooter
        sd
        stylua
        tmux
        tmuxp
        tokei
        typos
        yazi
        zoxide
      ]
      ++ [
        packages.${pkgs.stdenv.hostPlatform.system}.homeage
        packages.${pkgs.stdenv.hostPlatform.system}.nixvim-full
      ];
  };
}
