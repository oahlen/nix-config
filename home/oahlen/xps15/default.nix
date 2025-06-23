{
  hm-modules,
  pkgs,
  ...
}: {
  imports = [
    "${hm-modules}/desktop/hyprland"
    "${hm-modules}/programs/rbw"
  ];

  programs = {
    librewolf.enable = true;
    chromium.enable = true;
    ideavim.enable = true;
  };

  scripts.password-picker.enable = true;

  home.packages = with pkgs; [
    inkscape
    iwgtk
    nodejs
    virt-manager
  ];

  home.stateVersion = "25.05";
}
