{
  pkgs,
  user,
  ...
}: {
  hardware.amdgpu.overdrive.enable = true;

  programs.corectrl.enable = true;

  users.users.${user.name} = {
    extraGroups = ["corectrl"];
  };

  systemd = let
    target = "graphical-session.target";
  in {
    packages = [pkgs.corectrl];

    user.services.corectrl-user-service = {
      description = "CoreCtrl user service";
      wantedBy = [target];
      wants = [target];
      after = [target];
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.corectrl}/bin/corectrl --minimize-systray";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
  };
}
