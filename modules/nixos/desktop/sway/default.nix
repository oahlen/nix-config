{
  nixos-modules,
  pkgs,
  user,
  ...
}: {
  imports = [
    "${nixos-modules}/desktop/shared/fonts.nix"
  ];

  programs.sway = {
    enable = true;

    extraPackages = with pkgs; [
      brightnessctl
      grim
      libnotify
      papirus-icon-theme
      pavucontrol
      playerctl
      polkit_gnome
      slurp
      swayimg
      wf-recorder
      wl-clipboard
      wl-mirror
      xdg-utils
    ];
  };

  programs.xwayland.enable = true;

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [pkgs.xdg-desktop-portal-gtk];
  };

  programs.dconf.enable = true;

  services.dbus = {
    enable = true;
    packages = with pkgs; [gcr];
  };

  services.gnome.gnome-keyring.enable = true;

  security.polkit.enable = true;

  systemd = {
    user.services.polkit-gnome-authentication-agent-1 = {
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = ["sway-session.target"];
      wants = ["sway-session.target"];
      after = ["sway-session.target"];
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
  };

  users.users.${user.name} = {
    extraGroups = ["audio" "video"];
  };

  # Programs
  environment.systemPackages = with pkgs; [
    gnome-multi-writer
    gnome-text-editor
    loupe
    nautilus
  ];

  programs.gnome-disks.enable = true;
  programs.file-roller.enable = true;

  services.gvfs.enable = true;
  services.tumbler.enable = true;
}
