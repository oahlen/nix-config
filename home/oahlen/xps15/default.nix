{
  hm-modules,
  pkgs,
  ...
}: {
  imports = [
    "${hm-modules}/profiles/sway"
    "${hm-modules}/profiles/terminal"
    "${hm-modules}/programs/rbw"
  ];

  programs = {
    librewolf.enable = true;
    chromium.enable = true;
    ideavim.enable = true;
  };

  scripts.password-picker.enable = true;

  home.packages = with pkgs; [
    _1password-gui
    inkscape
    iwgtk
    nodejs
    virt-manager
  ];

  home.stateVersion = "25.05";
}
