{
  lib,
  pkgs,
  user,
  ...
}: {
  programs.fuzzel = {
    enable = true;

    settings = {
      main = {
        font = "${user.font.name}:size=${lib.strings.floatToString user.font.size}";
        terminal = "${pkgs.foot}/bin/foot -e";
        icons-enabled = "no";
        dpi-aware = "no";
        prompt = "\"> \"";

        width = 40;
        horizontal-pad = 16;
        vertical-pad = 12;
        inner-pad = 8;
        line-height = 16;
      };
      colors = {
        background = "${user.no_hex user.colorscheme.background}ff";
        border = "${user.no_hex user.colorscheme.bright-black}ff";
        input = "${user.no_hex user.colorscheme.foreground}ff";
        match = "${user.no_hex user.colorscheme.bright-yellow}ff";
        prompt = "${user.no_hex user.colorscheme.green}ff";
        selection = "${user.no_hex user.colorscheme.selection.background}ff";
        selection-match = "${user.no_hex user.colorscheme.yellow}ff";
        selection-text = "${user.no_hex user.colorscheme.bright-white}ff";
        text = "${user.no_hex user.colorscheme.foreground}ff";
      };
      border = {
        width = 2;
        radius = 4;
      };
    };
  };
}
