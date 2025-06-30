{
  config,
  lib,
  pkgs,
  user,
  ...
}: {
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
        foreground = user.no_hex user.colorscheme.foreground;
        background = user.no_hex user.colorscheme.background;

        selection-foreground = user.no_hex user.colorscheme.selection.foreground;
        selection-background = user.no_hex user.colorscheme.selection.background;

        regular0 = user.no_hex user.colorscheme.black;
        regular1 = user.no_hex user.colorscheme.red;
        regular2 = user.no_hex user.colorscheme.green;
        regular3 = user.no_hex user.colorscheme.yellow;
        regular4 = user.no_hex user.colorscheme.blue;
        regular5 = user.no_hex user.colorscheme.purple;
        regular6 = user.no_hex user.colorscheme.cyan;
        regular7 = user.no_hex user.colorscheme.white;

        bright0 = user.no_hex user.colorscheme.bright-black;
        bright1 = user.no_hex user.colorscheme.bright-red;
        bright2 = user.no_hex user.colorscheme.bright-green;
        bright3 = user.no_hex user.colorscheme.bright-yellow;
        bright4 = user.no_hex user.colorscheme.bright-blue;
        bright5 = user.no_hex user.colorscheme.bright-purple;
        bright6 = user.no_hex user.colorscheme.bright-cyan;
        bright7 = user.no_hex user.colorscheme.bright-white;
      };
    };
  };
}
