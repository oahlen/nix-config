{
  lib,
  pkgs,
  user,
  ...
}: {
  programs.kitty = {
    enable = true;

    environment = {
      TERM = "xterm-256color";
    };

    font = {
      name = user.font.name;
      size = user.font.size;
    };
    extraConfig = ''
      shell "${lib.getExe pkgs.fish}"
      hide_window_decorations yes
      window_padding_width 4 8

      foreground ${user.colorscheme.foreground}
      background ${user.colorscheme.background}

      selection_foreground ${user.colorscheme.selection.foreground}
      selection_background ${user.colorscheme.selection.background}

      color0 ${user.colorscheme.black}
      color1 ${user.colorscheme.red}
      color2 ${user.colorscheme.green}
      color3 ${user.colorscheme.yellow}
      color4 ${user.colorscheme.blue}
      color5 ${user.colorscheme.purple}
      color6 ${user.colorscheme.cyan}
      color7 ${user.colorscheme.white}

      color8 ${user.colorscheme.bright-black}
      color9 ${user.colorscheme.bright-red}
      color10 ${user.colorscheme.bright-green}
      color11 ${user.colorscheme.bright-yellow}
      color12 ${user.colorscheme.bright-blue}
      color13 ${user.colorscheme.bright-purple}
      color14 ${user.colorscheme.bright-cyan}
      color15 ${user.colorscheme.bright-white}
    '';
  };
}
