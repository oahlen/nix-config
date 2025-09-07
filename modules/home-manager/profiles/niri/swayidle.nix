{pkgs, ...}: let
  swaylock = "${pkgs.swaylock}/bin/swaylock -fF";
  niri = "${pkgs.niri}/bin/niri";
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
