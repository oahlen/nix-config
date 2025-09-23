{
  config,
  pkgs,
  ...
}: let
  target = config.wayland.systemd.target;
  no_hex = color: builtins.substring 1 (builtins.stringLength color - 1) color;
in {
  home.packages = with pkgs; [swaybg];

  systemd.user.services.swaybg = {
    Unit = {
      Description = "Wallpaper service for Wayland";
      PartOf = [target];
      After = [target];
      ConditionEnvironment = "WAYLAND_DISPLAY";
    };

    Service = {
      ExecStart = "${pkgs.swaybg}/bin/swaybg -o '*' -c ${no_hex config.colors.background} -i ${config.wallpaper} -m fit";
      Restart = "on-failure";
    };

    Install.WantedBy = [target];
  };
}
