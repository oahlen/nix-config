{
  lib,
  pkgs,
  ...
}: {
  programs.fish = {
    enable = true;

    interactiveShellInit = ''
      set fish_greeting

      # For tmux
      set -gx SHELL ${lib.getExe pkgs.fish}

      fish_vi_key_bindings
      set fish_vi_force_cursor
      set fish_cursor_default block
      set fish_cursor_insert line

      # Source extra config if it exists
      set -l EXTRA_CONFIG "$XDG_CONFIG_HOME/fish/extra.fish"
      if test -e $EXTRA_CONFIG
        source $EXTRA_CONFIG
      end

      # The superior note taking system
      bind \cn 'nvim $HOME/notes.txt'
    '';

    shellAbbrs = {
      bash = "/run/current-system/sw/bin/bash";
    };

    shellAliases = {
      cat = "bat";
      di = "dev-session";
      gi = "gitui";
      lf = "yazi";
      nix-edit = "tmuxp load -y nix-config";
      note-edit = "tmuxp load -y notes";
      tree = "eza --tree";
      vim = "nvim";
      vi = "nvim";
    };

    functions = {
      doscleanup = "fd . --type f --print0 | xargs -0 dos2unix";
      fetch = "pokeget random --hide-name | fastfetch  --logo-padding-top 2 --file-raw -";
      skim = "fzf --preview='bat {} --color=always --style=numbers' | xargs -r bat";
      vio = "fzf --preview='bat {} --color=always --style=numbers' | xargs -r nvim";
    };
  };

  xdg.configFile."fish" = {
    source = ./config;
    recursive = true;
  };
}
