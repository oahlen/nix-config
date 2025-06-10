{
  lib,
  user,
  ...
}: {
  services.mako = {
    enable = true;
    font = "${user.font.name} ${lib.strings.floatToString user.font.size}";
    anchor = "top-right";

    defaultTimeout = 10000;
    ignoreTimeout = true;

    textColor = user.colorscheme.foreground;
    backgroundColor = user.colorscheme.background;
    borderColor = user.colorscheme.bright-black;
    progressColor = user.colorscheme.blue;

    borderSize = 2;
    borderRadius = 4;
    padding = "12";
  };
}
