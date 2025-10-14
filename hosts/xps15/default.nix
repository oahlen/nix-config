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
    "${nixos-modules}/programs/virt-manager"
    "${nixos-modules}/services/bluetooth"
    "${nixos-modules}/services/flatpak"
    "${nixos-modules}/services/kanshi"
    "${nixos-modules}/services/plymouth"
    "${nixos-modules}/services/powertop"
    "${nixos-modules}/services/tailscale"
    "${nixos-modules}/services/yubikey"
  ];

  networking.hostName = "xps15";

  boot = {
    loader.systemd-boot.enable = true;
    blacklistedKernelModules = ["nouveau"];
  };

  modules.development.enable = true;

  services = {
    fstrim.enable = true;
    fwupd.enable = true;
    hardware.bolt.enable = true;
    power-profiles-daemon.enable = true;
    thermald.enable = true;

    kanshi = {
      enable = true;
      systemd.target = "niri-session.target";
    };
  };

  services.flatpak.packages = [
    "com.github.PintaProject.Pinta"
    "org.chromium.Chromium"
    "org.inkscape.Inkscape"
    "org.mozilla.firefox"
    "https://downloads.1password.com/linux/flatpak/1Password.flatpakref"
  ];

  environment.systemPackages = with pkgs; [
    nodejs
  ];

  fileSystems."/".options = ["noatime" "nodiratime" "discard"];

  system.stateVersion = "25.05";
}
