{
  nixos-modules,
  pkgs,
  ...
}: {
  imports = [
    "${nixos-modules}/programs/corectrl"
    "${nixos-modules}/programs/gamemode"
  ];

  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true; # Required by some more modern games like The Witcher 3
    };

    uinput.enable = true; # Virtual gamepad support
  };

  # Add udev rules for common game controllers
  services.udev.packages = with pkgs; [
    game-devices-udev-rules
  ];
}
