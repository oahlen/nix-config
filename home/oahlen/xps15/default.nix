{
  hm-modules,
  pkgs,
  ...
}: {
  imports = [
    "${hm-modules}/profiles/niri"
    "${hm-modules}/profiles/terminal"
    "${hm-modules}/programs/firefox"
    "${hm-modules}/programs/ideavim"
    "${hm-modules}/programs/rbw"
  ];

  scripts.password-picker.enable = true;

  wallpaper = ./sunset.jpg;

  home.packages = with pkgs; [
    hyprpicker
    iwgtk
    nodejs
    virt-manager
  ];

  # Flatpak programs
  # chromium
  # 1password
  # inskscape
  # Pinta

  home.stateVersion = "25.05";
}
