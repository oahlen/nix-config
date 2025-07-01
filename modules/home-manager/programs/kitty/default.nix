{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.kitty = {
    enable = true;

    environment = {
      TERM = "xterm-256color";
    };

    font = {
      name = config.font.name;
      size = config.font.size;
    };
    extraConfig = ''
      shell "${lib.getExe pkgs.fish}"
      hide_window_decorations yes
      window_padding_width 4 8

      foreground ${config.colorscheme.foreground}
      background ${config.colorscheme.background}

      selection_foreground ${config.colorscheme.selection.foreground}
      selection_background ${config.colorscheme.selection.background}

      color0 ${config.colorscheme.black}
      color1 ${config.colorscheme.red}
      color2 ${config.colorscheme.green}
      color3 ${config.colorscheme.yellow}
      color4 ${config.colorscheme.blue}
      color5 ${config.colorscheme.purple}
      color6 ${config.colorscheme.cyan}
      color7 ${config.colorscheme.white}

      color8 ${config.colorscheme.bright-black}
      color9 ${config.colorscheme.bright-red}
      color10 ${config.colorscheme.bright-green}
      color11 ${config.colorscheme.bright-yellow}
      color12 ${config.colorscheme.bright-blue}
      color13 ${config.colorscheme.bright-purple}
      color14 ${config.colorscheme.bright-cyan}
      color15 ${config.colorscheme.bright-white}
    '';
  };
}
