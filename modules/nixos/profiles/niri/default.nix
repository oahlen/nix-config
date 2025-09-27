{
  inputs,
  nixos-modules,
  pkgs,
  ...
}: {
  imports = [
    "${nixos-modules}/profiles/shared/desktop"
    "${nixos-modules}/profiles/shared/fonts"
    "${nixos-modules}/programs/gtklock"
    "${nixos-modules}/services/networkmanager"
    "${nixos-modules}/services/pipewire"
    "${nixos-modules}/services/polkit"
  ];

  services.displayManager.gdm.enable = true;

  nixpkgs.overlays = [
    (self: super: {
      niri = inputs.niri.packages.${pkgs.system}.default;
    })
  ];

  programs.niri.enable = true;

  systemd.user.targets.niri-session = {
    description = "niri compositor session";
    documentation = ["man:systemd.special(7)"];
    bindsTo = ["graphical-session.target"];
    wants = ["graphical-session-pre.target"];
    after = ["graphical-session-pre.target"];
  };

  environment.systemPackages = with pkgs; [
    brightnessctl
    hyprpicker
    libnotify
    papirus-icon-theme
    pavucontrol
    playerctl
    swayimg
    wl-clipboard
    wl-mirror
    xdg-utils
    xwayland-satellite
  ];

  services.polkit-gnome = {
    enable = true;
    systemd.target = "niri-session.target";
  };
}
