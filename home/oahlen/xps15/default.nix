{
  hm-modules,
  pkgs,
  ...
}: {
  imports = [
    "${hm-modules}/profiles/sway"
    "${hm-modules}/profiles/terminal"
    "${hm-modules}/programs/firefox"
    "${hm-modules}/programs/rbw"
  ];

  programs = {
    chromium.enable = true;
    ideavim.enable = true;
  };

  scripts.password-picker.enable = true;

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
