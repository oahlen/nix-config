{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.modules.yubikey;
in {
  options.modules.yubikey.enable = mkEnableOption "Enable Yubikey support";

  config = mkIf cfg.enable {
    services.pcscd.enable = true;

    services.udev.packages = with pkgs; [
      yubikey-personalization
    ];

    environment.systemPackages = with pkgs; [
      yubikey-touch-detector
      yubioath-flutter
    ];
  };
}
