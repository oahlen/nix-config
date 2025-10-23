{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.programs.homeage;
in
{
  options.programs.homeage.enable = mkEnableOption "Whether to enable homeage.";

  config = mkIf cfg.enable {
    environment.systemPackages =
      let
        package = pkgs.callPackage ./../../packages/homeage { };
      in
      [ package ];
  };
}
