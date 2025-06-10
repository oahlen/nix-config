{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  name = "toPdf";
in {
  options.scripts.toPdf.enable = mkEnableOption name;

  config = mkIf config.scripts.toPdf.enable {
    home.packages = with pkgs; let
      package = writeShellApplication {
        name = name;
        runtimeInputs = [
          ghostscript
          groff
          lowdown
        ];
        text = builtins.readFile ./${name};
      };
    in [package];
  };
}
