{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
  ];

  networking = {
    hostName = "xps15";
    firewall.checkReversePath = "loose";
  };

  boot = {
    loader.systemd-boot.enable = true;
    blacklistedKernelModules = [ "nouveau" ];
  };

  hardware.bluetooth.enable = true;

  powerManagement.powertop.enable = true;

  modules = {
    gnome.enable = true;
    niri.enable = true;
    podman.enable = true;
    virt-manager.enable = true;
    yubikey.enable = true;
  };

  services = {
    flatpak.enable = true;
    fstrim.enable = true;
    fwupd.enable = true;
    hardware.bolt.enable = true;
    kanshi.enable = true;
    power-profiles-daemon.enable = true;
    tailscale.enable = true;
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
