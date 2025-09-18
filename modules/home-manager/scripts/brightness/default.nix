{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  name = "brightness";
in {
  options.scripts.brightness.enable = mkEnableOption name;

  config = mkIf config.scripts.brightness.enable {
    home.packages = with pkgs; let
      package = writeShellApplication {
        name = name;
        runtimeInputs = [brightnessctl libnotify];
        text = builtins.readFile ./${name};
      };
    in [package];
  };
}
