{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.programs.homage;
in
{
  options.programs.homage.enable = mkEnableOption "Whether to enable homage.";

  config = mkIf cfg.enable {
    environment.systemPackages =
      let
        package = pkgs.callPackage ./../../packages/homage { };
      in
      [ package ];
  };
}
