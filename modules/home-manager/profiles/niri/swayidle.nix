{pkgs, ...}: let
  gtklock = "${pkgs.gtklock}/bin/gtklock -d";
  niri = "${pkgs.niri}/bin/niri";
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
        command = "${niri} msg action power-off-monitors";
        resumeCommand = "${niri} msg action power-on-monitors";
      }
      {
        timeout = 1800;
        command = "${pkgs.systemd}/bin/systemctl suspend";
      }
    ];
  };
}
