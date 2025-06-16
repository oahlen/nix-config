{pkgs, ...}: let
  gtklock = "${pkgs.gtklock}/bin/gtklock -d";
  swaymsg = "${pkgs.sway}/bin/swaymsg";
in {
  services.swayidle = {
    enable = true;
    systemdTarget = "sway-session.target";

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
