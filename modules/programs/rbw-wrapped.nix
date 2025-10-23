{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.programs.rbw-wrapped;
in
{
  options.programs.rbw-wrapped.enable = mkEnableOption "Whether to enable rbw (wrapped).";

  config = mkIf cfg.enable {
    environment.systemPackages =
      let
        package = pkgs.callPackage ./../../packages/rbw { };
      in
      [ package ];
  };
}
