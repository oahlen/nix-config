{
  nixos-modules,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    "${nixos-modules}/common/boot"
    "${nixos-modules}/profiles/gaming"
    "${nixos-modules}/profiles/sway"
    "${nixos-modules}/profiles/terminal"
    "${nixos-modules}/programs/podman"
    "${nixos-modules}/services/bluetooth"
    "${nixos-modules}/services/tailscale"
    "${nixos-modules}/services/yubikey"
  ];

  networking.hostName = "desktop";

  boot = {
    loader.systemd-boot.enable = true;
    kernelPackages = pkgs.linuxPackages_6_16;
    kernelModules = ["amdgpu"];
  };

  services = {
    fstrim.enable = true;
    power-profiles-daemon.enable = true;
  };

  fileSystems = {
    "/".options = ["noatime" "nodiratime" "discard"];
    "/mnt/backup".options = ["noatime" "nodiratime" "discard"];
  };

  system.stateVersion = "22.11";
}
