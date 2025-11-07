{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
  ];

  networking.hostName = "desktop";

  boot = {
    loader.systemd-boot.enable = true;
    kernelPackages = pkgs.linuxPackages_6_17;
    kernelModules = [ "amdgpu" ];
  };

  hardware.bluetooth.enable = true;

  modules = {
    gaming.enable = true;
    desktop.niri.enable = true;
    virtualisation.podman.enable = true;
    networking.tailscale.enable = true;
    security.yubikey.enable = true;
  };

  services = {
    flatpak.packages = [
      "com.bitwarden.desktop"
      "com.github.PintaProject.Pinta"
      "md.obsidian.Obsidian"
      "org.inkscape.Inkscape"
      "org.keepassxc.KeePassXC"
      "org.mozilla.firefox"
    ];

    fstrim.enable = true;
    power-profiles-daemon.enable = true;
  };

  environment.systemPackages =
    with pkgs;
    [
      fastfetch
      nfs-utils
      rbw-wrapped
    ]
    ++ (import ../packages.nix pkgs);

  fileSystems = {
    "/".options = [
      "noatime"
      "nodiratime"
      "discard"
    ];
    "/mnt/backup".options = [
      "noatime"
      "nodiratime"
      "discard"
    ];
  };

  system.stateVersion = "22.11";
}
