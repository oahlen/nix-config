{
  nixpkgs,
  system,
  ...
}:
let
  pkgs = import nixpkgs { inherit system; };
  base = pkgs.appimageTools.defaultFhsEnvArgs;
in
(pkgs.buildFHSEnv (
  base
  // {
    name = "fhs";
    targetPkgs = pkgs: (base.targetPkgs pkgs) ++ [ pkgs.pkg-config ];
    profile = "export NIX_SHELL=FHS";
    runScript = "fish";
    extraOutputsToInstall = [ "dev" ];
  }
)).env
