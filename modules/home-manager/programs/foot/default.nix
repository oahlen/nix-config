{
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
        font = "${user.font.name}:size=${lib.strings.floatToString user.font.size}";
        dpi-aware = "no";
        pad = "10x10";
      };

      colors = {
        foreground = user.colorscheme.no_hex user.colorscheme.foreground;
        background = user.colorscheme.no_hex user.colorscheme.background;

        selection-foreground = user.colorscheme.no_hex user.colorscheme.selection.foreground;
        selection-background = user.colorscheme.no_hex user.colorscheme.selection.background;

        regular0 = user.colorscheme.no_hex user.colorscheme.black;
        regular1 = user.colorscheme.no_hex user.colorscheme.red;
        regular2 = user.colorscheme.no_hex user.colorscheme.green;
        regular3 = user.colorscheme.no_hex user.colorscheme.yellow;
        regular4 = user.colorscheme.no_hex user.colorscheme.blue;
        regular5 = user.colorscheme.no_hex user.colorscheme.purple;
        regular6 = user.colorscheme.no_hex user.colorscheme.cyan;
        regular7 = user.colorscheme.no_hex user.colorscheme.white;

        bright0 = user.colorscheme.no_hex user.colorscheme.bright-black;
        bright1 = user.colorscheme.no_hex user.colorscheme.bright-red;
        bright2 = user.colorscheme.no_hex user.colorscheme.bright-green;
        bright3 = user.colorscheme.no_hex user.colorscheme.bright-yellow;
        bright4 = user.colorscheme.no_hex user.colorscheme.bright-blue;
        bright5 = user.colorscheme.no_hex user.colorscheme.bright-purple;
        bright6 = user.colorscheme.no_hex user.colorscheme.bright-cyan;
        bright7 = user.colorscheme.no_hex user.colorscheme.bright-white;
      };
    };
  };
}
