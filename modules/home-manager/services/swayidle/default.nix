{pkgs, ...}: let
  swaylock = "${pkgs.swaylock}/bin/swaylock -fF";
  swaymsg = "${pkgs.sway}/bin/swaymsg";
in {
  services.swayidle = {
    enable = true;

    events = [
      {
        event = "before-sleep";
        command = swaylock;
      }
    ];

    timeouts = [
      {
        timeout = 300;
        command = swaylock;
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
