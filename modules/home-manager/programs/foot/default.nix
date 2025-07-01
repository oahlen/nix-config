{
  config,
  lib,
  pkgs,
  ...
}: let
  no_hex = color: builtins.substring 1 (builtins.stringLength color - 1) color;
in {
  programs.foot = {
    enable = true;

    settings = {
      main = {
        shell = "${lib.getExe pkgs.fish}";
        term = "xterm-256color";
        font = "${config.font.name}:size=${lib.strings.floatToString config.font.size}";
        dpi-aware = "no";
        pad = "10x10";
      };

      colors = {
        foreground = no_hex config.colorscheme.foreground;
        background = no_hex config.colorscheme.background;

        selection-foreground = no_hex config.colorscheme.selection.foreground;
        selection-background = no_hex config.colorscheme.selection.background;

        regular0 = no_hex config.colorscheme.black;
        regular1 = no_hex config.colorscheme.red;
        regular2 = no_hex config.colorscheme.green;
        regular3 = no_hex config.colorscheme.yellow;
        regular4 = no_hex config.colorscheme.blue;
        regular5 = no_hex config.colorscheme.purple;
        regular6 = no_hex config.colorscheme.cyan;
        regular7 = no_hex config.colorscheme.white;

        bright0 = no_hex config.colorscheme.bright-black;
        bright1 = no_hex config.colorscheme.bright-red;
        bright2 = no_hex config.colorscheme.bright-green;
        bright3 = no_hex config.colorscheme.bright-yellow;
        bright4 = no_hex config.colorscheme.bright-blue;
        bright5 = no_hex config.colorscheme.bright-purple;
        bright6 = no_hex config.colorscheme.bright-cyan;
        bright7 = no_hex config.colorscheme.bright-white;
      };
    };
  };
}
