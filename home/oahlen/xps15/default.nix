{
  hm-modules,
  pkgs,
  ...
}: {
  imports = [
    "${hm-modules}/programs/foot"
    "${hm-modules}/programs/rbw"
  ];

  programs.chromium.enable = true;
  programs.ideavim.enable = true;

  scripts.password-picker.enable = true;

  home.packages = with pkgs; [
    inkscape
    iwgtk
    librewolf
    nodejs
    virt-manager
  ];

  home.stateVersion = "25.05";
}
