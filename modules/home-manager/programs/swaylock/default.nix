{config, ...}: let
  no_hex = color: builtins.substring 1 (builtins.stringLength color - 1) color;
in {
  programs.swaylock = {
    enable = true;
    settings = {
      ignore-empty-password = true;
      font = config.font.name;
      font-size = 24;

      color = no_hex config.colorscheme.background;
      scaling = "solid_color";

      indicator-radius = 120;
      indicator-thickness = 20;

      inside-color = "00000000";
      inside-clear-color = "00000000";
      inside-caps-lock-color = "00000000";
      inside-ver-color = "00000000";
      inside-wrong-color = "00000000";

      line-color = no_hex config.colorscheme.bright-black;
      line-clear-color = no_hex config.colorscheme.yellow;
      line-caps-lock-color = no_hex config.colorscheme.purple;
      line-ver-color = no_hex config.colorscheme.blue;
      line-wrong-color = no_hex config.colorscheme.red;

      ring-color = "00000000";
      ring-clear-color = no_hex config.colorscheme.yellow;
      ring-caps-lock-color = no_hex config.colorscheme.purple;
      ring-ver-color = no_hex config.colorscheme.blue;
      ring-wrong-color = no_hex config.colorscheme.red;

      separator-color = "00000000";

      key-hl-color = no_hex config.colorscheme.blue;
      bs-hl-color = no_hex config.colorscheme.yellow;
      caps-lock-key-hl-color = no_hex config.colorscheme.blue;
      caps-lock-bs-hl-color = no_hex config.colorscheme.yellow;

      text-color = no_hex config.colorscheme.foreground;
      text-clear-color = no_hex config.colorscheme.yellow;
      text-caps-lock-color = no_hex config.colorscheme.purple;
      text-ver-color = no_hex config.colorscheme.blue;
      text-wrong-color = no_hex config.colorscheme.red;

      layout-bg-color = "00000000";
      layout-border-color = "00000000";
      layout-text-color = no_hex config.colorscheme.foreground;
    };
  };
}
