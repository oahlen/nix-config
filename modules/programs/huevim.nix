{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.programs.huevim;
in
{
  options.programs.huevim.enable = mkEnableOption "Whether to enable HueVim.";

  config = mkIf cfg.enable {
    environment.systemPackages =
      let
        package = pkgs.callPackage ./../../packages/huevim { };
      in
      [ package ];
  };
}
