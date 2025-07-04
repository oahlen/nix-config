{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  name = "theme-switcher";
in {
  options.scripts.theme-switcher.enable = mkEnableOption name;

  config = mkIf config.scripts.theme-switcher.enable {
    home.packages = with pkgs; let
      package = writeShellApplication {
        name = name;
        runtimeInputs = [dconf fuzzel];
        text = builtins.readFile ./${name};
      };
    in [package];
  };
}
