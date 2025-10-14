{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.modules.fonts;
in {
  options.modules.fonts.enable = mkEnableOption "Enable default fonts";

  config = mkIf cfg.enable {
    fonts.packages = with pkgs; [
      dejavu_fonts
      liberation_ttf
      nerd-fonts.jetbrains-mono
      noto-fonts-emoji
    ];
  };
}
