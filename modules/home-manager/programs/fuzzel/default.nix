{
  config,
  lib,
  pkgs,
  ...
}: let
  no_hex = color: builtins.substring 1 (builtins.stringLength color - 1) color;
in {
  programs.fuzzel = {
    enable = true;

    settings = {
      main = {
        font = "${config.font.name}:size=${lib.strings.floatToString config.font.size}";
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
        background = "${no_hex config.colorscheme.background}ff";
        border = "${no_hex config.colorscheme.bright-black}ff";
        input = "${no_hex config.colorscheme.foreground}ff";
        match = "${no_hex config.colorscheme.bright-yellow}ff";
        prompt = "${no_hex config.colorscheme.green}ff";
        selection = "${no_hex config.colorscheme.selection.background}ff";
        selection-match = "${no_hex config.colorscheme.yellow}ff";
        selection-text = "${no_hex config.colorscheme.bright-white}ff";
        text = "${no_hex config.colorscheme.foreground}ff";
      };

      border = {
        width = 2;
        radius = 4;
      };
    };
  };
}
