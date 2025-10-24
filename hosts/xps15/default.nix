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
    development.enable = true;

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
    flatpak.enable = true;
    fstrim.enable = true;
    fwupd.enable = true;
    hardware.bolt.enable = true;
    kanshi.enable = true;
    power-profiles-daemon.enable = true;
    thermald.enable = true;
  };

  programs.rbw-wrapped.enable = true;

  environment.systemPackages = with pkgs; [
    nodejs
    powertop
  ];

  fileSystems."/".options = [
    "noatime"
    "nodiratime"
    "discard"
  ];

  system.stateVersion = "25.05";
}
