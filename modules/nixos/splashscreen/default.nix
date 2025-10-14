{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.modules.splashscreen;
in {
  options.modules.splashscreen.enable = mkEnableOption "Enable splashscreen";

  config = mkIf cfg.enable {
    boot = {
      plymouth.enable = true;

      consoleLogLevel = 3;
      initrd.verbose = false;
      initrd.systemd.enable = true;

      kernelParams = [
        "quiet"
        "splash"
        "intremap=on"
        "boot.shell_on_fail"
        "udev.log_priority=3"
        "rd.systemd.show_status=auto"
      ];
    };
  };
}
