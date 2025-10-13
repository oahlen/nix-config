{
  customPackages,
  pkgs,
  ...
}: let
  arch = pkgs.stdenv.hostPlatform.system;
in {
  environment.systemPackages = [customPackages.${arch}.rbw];
}
