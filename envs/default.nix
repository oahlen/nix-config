{
  buildEnv,
  packagesToInstall ? [ ],
  pkgs,
}:
let
  env = buildEnv {
    name = "environment";
    paths = packagesToInstall;

    pathsToLink = [
      "/share/man"
      "/share/doc"
      "/bin"
    ];
    extraOutputsToInstall = [
      "man"
      "doc"
    ];
  };
in
env
// {
  switch = pkgs.writeShellScriptBin "switch" ''
    nix-env --set ${env} "$@"
  '';
}
