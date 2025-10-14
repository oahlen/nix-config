{
  customPackages,
  nixos-modules,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    "${nixos-modules}/profiles/niri"
  ];

  networking.hostName = "xps15";

  boot = {
    loader.systemd-boot.enable = true;
    blacklistedKernelModules = ["nouveau"];
  };

  hardware.bluetooth.enable = true;

  powerManagement.powertop.enable = true;

  modules = {
    development.enable = true;
    fonts.enable = true;
    podman.enable = true;
    splashscreen.enable = true;
    tailscale.enable = true;
    virt-manager.enable = true;
    yubikey.enable = true;
  };

  services = {
    fstrim.enable = true;
    fwupd.enable = true;
    hardware.bolt.enable = true;
    kanshi.enable = true;
    power-profiles-daemon.enable = true;
    thermald.enable = true;

    flatpak.packages = [
      "com.github.PintaProject.Pinta"
      "org.chromium.Chromium"
      "org.inkscape.Inkscape"
      "org.mozilla.firefox"
      "https://downloads.1password.com/linux/flatpak/1Password.flatpakref"
    ];
  };

  environment.systemPackages = with pkgs; [
    nodejs
    powertop
    customPackages.${pkgs.stdenv.hostPlatform.system}.rbw
  ];

  fileSystems."/".options = ["noatime" "nodiratime" "discard"];

  system.stateVersion = "25.05";
}
