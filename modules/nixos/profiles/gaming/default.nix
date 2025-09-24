{
  nixos-modules,
  pkgs,
  ...
}: {
  imports = [
    "${nixos-modules}/programs/gamemode"
  ];

  hardware = {
    amdgpu.overdrive.enable = true;

    graphics = {
      enable = true;
      enable32Bit = true; # Required by some more modern games like The Witcher 3
    };

    uinput.enable = true; # Virtual gamepad support
  };

  services.lact.enable = true;

  # Add udev rules for common game controllers
  services.udev.packages = with pkgs; [
    game-devices-udev-rules
  ];

  # Game launchers and utilities
  environment.systemPackages = with pkgs; [
    heroic
    mangohud
  ];
}
