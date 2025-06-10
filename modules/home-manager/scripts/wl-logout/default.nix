{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  name = "wl-logout";
in {
  options.scripts.wl-logout.enable = mkEnableOption name;

  config = mkIf config.scripts.wl-logout.enable {
    home.packages = with pkgs; let
      package = writeShellApplication {
        name = name;
        runtimeInputs = [fuzzel];
        text = builtins.readFile ./${name};
      };
    in [package];
  };
}
