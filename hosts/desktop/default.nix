{
  nixos-modules,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    "${nixos-modules}/profiles/niri"
    "${nixos-modules}/programs/podman"
    "${nixos-modules}/programs/rbw"
    "${nixos-modules}/services/bluetooth"
    "${nixos-modules}/services/flatpak"
    "${nixos-modules}/services/plymouth"
    "${nixos-modules}/services/tailscale"
    "${nixos-modules}/services/yubikey"
  ];

  networking.hostName = "desktop";

  boot = {
    loader.systemd-boot.enable = true;
    kernelPackages = pkgs.linuxPackages_6_17;
    kernelModules = ["amdgpu"];
  };

  modules.development.enable = true;
  modules.gaming.enable = true;

  services = {
    fstrim.enable = true;
    power-profiles-daemon.enable = true;
  };

  services.flatpak.packages = [
    "com.bitwarden.desktop"
    "com.github.PintaProject.Pinta"
    "md.obsidian.Obsidian"
    "org.inkscape.Inkscape"
    "org.keepassxc.KeePassXC"
    "org.mozilla.firefox"
  ];

  wallpaper = ./lake.png;

  fileSystems = {
    "/".options = ["noatime" "nodiratime" "discard"];
    "/mnt/backup".options = ["noatime" "nodiratime" "discard"];
  };

  system.stateVersion = "22.11";
}
