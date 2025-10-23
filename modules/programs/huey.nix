{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.programs.huey;
in
{
  options.programs.huey.enable = mkEnableOption "Whether to enable huey.";

  config = mkIf cfg.enable {
    environment.systemPackages =
      let
        package = pkgs.callPackage ./../../packages/huey { };
      in
      [ package ];
  };
}
