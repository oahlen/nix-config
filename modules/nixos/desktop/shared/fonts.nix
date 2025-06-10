{pkgs, ...}: {
  # Font settings
  fonts.packages = with pkgs; [
    dejavu_fonts
    liberation_ttf
    nerd-fonts.jetbrains-mono
    noto-fonts-emoji
  ];
}
