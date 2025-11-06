{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
  ];

  networking.hostName = "xps15";

  boot = {
    loader.systemd-boot.enable = true;
    blacklistedKernelModules = [ "nouveau" ];
  };

  hardware.bluetooth.enable = true;

  powerManagement.powertop.enable = true;

  modules = {
    desktop = {
      gnome.enable = true;
      niri.enable = true;
    };

    networking.tailscale.enable = true;

    virtualisation = {
      podman.enable = true;
      virt-manager.enable = true;
    };

    security.yubikey.enable = true;
  };

  services = {
    flatpak.packages = [
      "com.github.PintaProject.Pinta"
      "org.chromium.Chromium"
      "org.inkscape.Inkscape"
      "org.mozilla.firefox"
    ];

    fstrim.enable = true;
    fwupd.enable = true;
    hardware.bolt.enable = true;
    kanshi.enable = true;
    power-profiles-daemon.enable = true;
    thermald.enable = true;
  };

  environment.systemPackages = with pkgs; [
    _1password-gui
    fastfetch
    nodejs
    powertop
    rbw-wrapped
  ];

  fileSystems."/".options = [
    "noatime"
    "nodiratime"
    "discard"
  ];

  system.stateVersion = "25.05";
}
