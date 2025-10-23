{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.programs.nixvim;
in
{
  options.programs.nixvim.enable = mkEnableOption "Whether to enable nixvim.";

  config = mkIf cfg.enable {
    environment.systemPackages =
      let
        package = pkgs.callPackage ./../../packages/nixvim { full = true; };
      in
      [ package ];
  };
}
