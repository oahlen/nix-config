{
  nixos-modules,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    "${nixos-modules}/desktop/cosmic"
    "${nixos-modules}/programs/podman"
    "${nixos-modules}/programs/virt-manager"
    "${nixos-modules}/services/networkmanager"
    "${nixos-modules}/services/pipewire"
    "${nixos-modules}/services/tailscale"
    "${nixos-modules}/services/yubikey"
  ];

  networking.hostName = "xps15";

  boot.loader.systemd-boot.enable = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Setup keyfile
  boot.initrd.secrets = {
    "/crypto_keyfile.bin" = null;
  };

  # Enable swap on luks
  boot.initrd.luks.devices."luks-c0f7c1eb-a5fe-499d-b9f5-8dc04118559f" = {
    device = "/dev/disk/by-uuid/c0f7c1eb-a5fe-499d-b9f5-8dc04118559f";
    keyFile = "/crypto_keyfile.bin";
  };

  services = {
    hardware.bolt.enable = true;
    fwupd.enable = true;
    thermald.enable = true;
    printing.enable = true;
    flatpak.enable = true;
  };

  fileSystems."/".options = ["noatime" "nodiratime" "discard"];

  system.stateVersion = "25.05";
}
