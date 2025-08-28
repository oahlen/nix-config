{nixos-modules, ...}: {
  imports = [
    "${nixos-modules}/programs/corectrl"
    "${nixos-modules}/programs/gamemode"
  ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true; # Required by some more modern games like The Witcher 3
  };
}
