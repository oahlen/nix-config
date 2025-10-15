{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.modules.boot.plymouth;
in {
  options.modules.boot.plymouth.enable = mkEnableOption "Enable Plymouth";

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
