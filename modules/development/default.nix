{
  config,
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
    enable = mkEnableOption "Whether to enable development support.";
  };

  config = mkIf cfg.enable {
    environment.variables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
      PAGER = "less";
    };

    programs = {
      direnv = {
        enable = true;
        nix-direnv.enable = true;
      };

      git.enable = true;
      homage.enable = true;
      huey.enable = true;
      less.enable = true;
      nixvim.enable = true;
    };

    environment.systemPackages = with pkgs; [
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
    ];
  };
}
