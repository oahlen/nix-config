{user, ...}: {
  programs.swaylock = {
    enable = true;
    settings = {
      ignore-empty-password = true;
      font = user.font.name;
      font-size = 24;

      color = user.colorscheme.no_hex user.colorscheme.background;
      scaling = "solid_color";

      indicator-radius = 120;
      indicator-thickness = 20;

      inside-color = "00000000";
      inside-clear-color = "00000000";
      inside-caps-lock-color = "00000000";
      inside-ver-color = "00000000";
      inside-wrong-color = "00000000";

      line-color = user.colorscheme.no_hex user.colorscheme.bright-black;
      line-clear-color = user.colorscheme.no_hex user.colorscheme.yellow;
      line-caps-lock-color = user.colorscheme.no_hex user.colorscheme.purple;
      line-ver-color = user.colorscheme.no_hex user.colorscheme.blue;
      line-wrong-color = user.colorscheme.no_hex user.colorscheme.red;

      ring-color = "00000000";
      ring-clear-color = user.colorscheme.no_hex user.colorscheme.yellow;
      ring-caps-lock-color = user.colorscheme.no_hex user.colorscheme.purple;
      ring-ver-color = user.colorscheme.no_hex user.colorscheme.blue;
      ring-wrong-color = user.colorscheme.no_hex user.colorscheme.red;

      separator-color = "00000000";

      key-hl-color = user.colorscheme.no_hex user.colorscheme.blue;
      bs-hl-color = user.colorscheme.no_hex user.colorscheme.yellow;
      caps-lock-key-hl-color = user.colorscheme.no_hex user.colorscheme.blue;
      caps-lock-bs-hl-color = user.colorscheme.no_hex user.colorscheme.yellow;

      text-color = user.colorscheme.no_hex user.colorscheme.foreground;
      text-clear-color = user.colorscheme.no_hex user.colorscheme.yellow;
      text-caps-lock-color = user.colorscheme.no_hex user.colorscheme.purple;
      text-ver-color = user.colorscheme.no_hex user.colorscheme.blue;
      text-wrong-color = user.colorscheme.no_hex user.colorscheme.red;

      layout-bg-color = "00000000";
      layout-border-color = "00000000";
      layout-text-color = user.colorscheme.no_hex user.colorscheme.foreground;
    };
  };
}
