{
  config,
  customPackages,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.modules.development;
in
{
  options.modules.development = {
    enable = mkEnableOption "Enable development module";
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
        nixfmt-tree
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
        stylua
        tmux
        tmuxp
        tokei
        tree
        typos
        unzip
        wget
        xdg-user-dirs
        yazi
        zip
        zoxide
      ]
      ++ [
        customPackages.${pkgs.stdenv.hostPlatform.system}.nixvim-full
      ];
  };
}
