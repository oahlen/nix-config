{
  nixos-modules,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    "${nixos-modules}/profiles/sway"
    "${nixos-modules}/profiles/terminal"
    "${nixos-modules}/programs/podman"
    "${nixos-modules}/programs/virt-manager"
    "${nixos-modules}/services/powertop"
    "${nixos-modules}/services/tailscale"
    "${nixos-modules}/services/yubikey"
  ];

  networking.hostName = "xps15";

  boot = {
    loader.systemd-boot.enable = true;
    kernelPackages = pkgs.linuxPackages_latest;
    blacklistedKernelModules = ["nouveau"];
  };

  services = {
    flatpak.enable = true;
    fwupd.enable = true;
    hardware.bolt.enable = true;
    power-profiles-daemon.enable = true;
    printing.enable = true;
    thermald.enable = true;
  };

  fileSystems."/".options = ["noatime" "nodiratime" "discard"];

  system.stateVersion = "25.05";
}
