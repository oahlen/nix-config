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

  networking.hostName = "desktop";

  boot = {
    loader.systemd-boot.enable = true;
    kernelPackages = pkgs.linuxPackages_6_17;
    kernelModules = ["amdgpu"];
  };

  hardware.bluetooth.enable = true;

  modules = {
    development.enable = true;
    fonts.enable = true;
    gaming.enable = true;
    podman.enable = true;
    splashscreen.enable = true;
    tailscale.enable = true;
    yubikey.enable = true;
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
    customPackages.${pkgs.stdenv.hostPlatform.system}.rbw
  ];

  wallpaper = ./lake.png;

  fileSystems = {
    "/".options = ["noatime" "nodiratime" "discard"];
    "/mnt/backup".options = ["noatime" "nodiratime" "discard"];
  };

  system.stateVersion = "22.11";
}
