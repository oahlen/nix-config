{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.modules.security.yubikey;
in
{
  options.modules.security.yubikey.enable = mkEnableOption "Whether to enable Yubikey support.";

  config = mkIf cfg.enable {
    services.pcscd.enable = true;

    services.udev.packages = with pkgs; [
      yubikey-personalization
    ];

    programs.yubikey-touch-detector.enable = true;

    environment.systemPackages = with pkgs; [
      yubioath-flutter
    ];
  };
}
