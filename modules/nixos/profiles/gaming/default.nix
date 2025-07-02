{nixos-modules, ...}: {
  imports = [
    "${nixos-modules}/programs/corectrl"
    "${nixos-modules}/programs/gamemode"
  ];
}
