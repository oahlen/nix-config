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

      foreground ${config.colors.foreground}
      background ${config.colors.background}

      selection_foreground ${config.colors.selection.foreground}
      selection_background ${config.colors.selection.background}

      color0 ${config.colors.black}
      color1 ${config.colors.red}
      color2 ${config.colors.green}
      color3 ${config.colors.yellow}
      color4 ${config.colors.blue}
      color5 ${config.colors.purple}
      color6 ${config.colors.cyan}
      color7 ${config.colors.white}

      color8 ${config.colors.bright-black}
      color9 ${config.colors.bright-red}
      color10 ${config.colors.bright-green}
      color11 ${config.colors.bright-yellow}
      color12 ${config.colors.bright-blue}
      color13 ${config.colors.bright-purple}
      color14 ${config.colors.bright-cyan}
      color15 ${config.colors.bright-white}
    '';
  };
}
