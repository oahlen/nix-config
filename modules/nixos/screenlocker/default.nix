{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.modules.screenlocker;
in {
  options.modules.screenlocker = {
    enable = mkEnableOption "Enable screenlocker";

    systemd.target = lib.mkOption {
      type = lib.types.str;
      description = ''
        The systemd target that will automatically start the screenlocker idle service.
      '';
      default = config.wayland.systemd.target;
    };
  };

  config = mkIf cfg.enable {
    programs.gtklock = {
      enable = true;

      config = {
        main = {
          gtk-theme = "adw-gtk3-dark";
          idle-hide = true;
          idle-timeout = 10;
        };
      };

      modules = with pkgs; [
        gtklock-playerctl-module
        gtklock-powerbar-module
        gtklock-userinfo-module
      ];
    };

    environment.systemPackages = with pkgs; [
      adw-gtk3
    ];

    systemd.user.services.swayidle = {
      description = "Idle manager for Wayland";
      documentation = ["man:swayidle(1)"];

      after = [cfg.systemd.target];
      partOf = [cfg.systemd.target];
      requires = [cfg.systemd.target];
      wantedBy = [cfg.systemd.target];
      wants = [cfg.systemd.target];

      unitConfig = {
        ConditionEnvironment = "WAYLAND_DISPLAY";
      };

      # TODO Make monitor command configurable
      serviceConfig = {
        Environment = ["PATH=${lib.makeBinPath [pkgs.bash]}"];
        Type = "simple";
        ExecStart = ''
          ${pkgs.swayidle}/bin/swayidle -w \
          timeout 300 '${pkgs.gtklock}/bin/gtklock -d' \
          timeout 900 '${pkgs.niri}/bin/niri msg action power-off-monitors' resume '${pkgs.niri}/bin/niri msg action power-on-monitors' \
          timeout 1800 '${pkgs.systemd}/bin/systemctl suspend' \
          before-sleep '${pkgs.gtklock}/bin/gtklock -d'
        '';
        Restart = "on-failure";
      };
    };
  };
}
