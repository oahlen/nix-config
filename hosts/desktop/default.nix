{
  packages,
  pkgs,
  ...
}:
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
    development.enable = true;
    gaming.enable = true;
    desktop.niri.enable = true;
    virtualisation.podman.enable = true;
    networking.tailscale.enable = true;
    security.yubikey.enable = true;
  };

  services = {
    fstrim.enable = true;
    power-profiles-daemon.enable = true;

    flatpak.packages = [
      "com.bitwarden.desktop"
      "com.github.PintaProject.Pinta"
      "md.obsidian.Obsidian"
      "org.inkscape.Inkscape"
      "org.keepassxc.KeePassXC"
      "org.mozilla.firefox"
    ];
  };

  environment.systemPackages = [
    packages.${pkgs.stdenv.hostPlatform.system}.rbw
  ];

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
