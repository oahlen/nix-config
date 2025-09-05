{
  hm-modules,
  pkgs,
  ...
}: {
  imports = [
    "${hm-modules}/profiles/sway"
    "${hm-modules}/profiles/terminal"
    "${hm-modules}/programs/firefox"
    "${hm-modules}/programs/ideavim"
    "${hm-modules}/programs/rbw"
  ];

  programs = {
    chromium.enable = true;
  };

  scripts.password-picker.enable = true;

  wallpaper = ./sunset.jpg;

  home.packages = with pkgs; [
    _1password-gui
    hyprpicker
    inkscape
    iwgtk
    nodejs
    pinta
    virt-manager
  ];

  home.stateVersion = "25.05";
}
