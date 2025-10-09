{
  config,
  pkgs,
  ...
}: let
  gtklock = "${pkgs.gtklock}/bin/gtklock -d";
  swaymsg = "${config.wayland.windowManager.sway.package}/bin/swaymsg";
in {
  services.swayidle = {
    enable = true;

    events = [
      {
        event = "before-sleep";
        command = gtklock;
      }
    ];

    timeouts = [
      {
        timeout = 300;
        command = gtklock;
      }
      {
        timeout = 900;
        command = "${swaymsg} 'output * power off'";
        resumeCommand = "${swaymsg} 'output * power on'";
      }
      {
        timeout = 1800;
        command = "${pkgs.systemd}/bin/systemctl suspend";
      }
    ];
  };
}
