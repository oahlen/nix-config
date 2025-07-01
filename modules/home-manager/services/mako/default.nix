{
  config,
  lib,
  ...
}: {
  services.mako = {
    enable = true;

    settings = {
      font = "${config.font.name} ${lib.strings.floatToString config.font.size}";
      anchor = "top-right";

      default-timeout = 10000;
      ignore-timeout = true;

      text-color = config.colorscheme.foreground;
      background-color = config.colorscheme.background;
      border-color = config.colorscheme.bright-black;
      progress-color = config.colorscheme.blue;

      border-size = 2;
      border-radius = 4;
      padding = "12";
    };
  };
}
