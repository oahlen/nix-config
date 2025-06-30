{
  config,
  lib,
  user,
  ...
}: {
  services.mako = {
    enable = true;

    settings = {
      font = "${config.font.name} ${lib.strings.floatToString config.font.size}";
      anchor = "top-right";

      default-timeout = 10000;
      ignore-timeout = true;

      text-color = user.colorscheme.foreground;
      background-color = user.colorscheme.background;
      border-color = user.colorscheme.bright-black;
      progress-color = user.colorscheme.blue;

      border-size = 2;
      border-radius = 4;
      padding = "12";
    };
  };
}
