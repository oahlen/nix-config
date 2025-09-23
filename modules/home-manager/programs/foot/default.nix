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
        foreground = no_hex config.colors.foreground;
        background = no_hex config.colors.background;

        selection-foreground = no_hex config.colors.selection.foreground;
        selection-background = no_hex config.colors.selection.background;

        regular0 = no_hex config.colors.black;
        regular1 = no_hex config.colors.red;
        regular2 = no_hex config.colors.green;
        regular3 = no_hex config.colors.yellow;
        regular4 = no_hex config.colors.blue;
        regular5 = no_hex config.colors.purple;
        regular6 = no_hex config.colors.cyan;
        regular7 = no_hex config.colors.white;

        bright0 = no_hex config.colors.bright-black;
        bright1 = no_hex config.colors.bright-red;
        bright2 = no_hex config.colors.bright-green;
        bright3 = no_hex config.colors.bright-yellow;
        bright4 = no_hex config.colors.bright-blue;
        bright5 = no_hex config.colors.bright-purple;
        bright6 = no_hex config.colors.bright-cyan;
        bright7 = no_hex config.colors.bright-white;
      };
    };
  };
}
