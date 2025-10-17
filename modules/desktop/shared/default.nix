{
  config,
  pkgs,
}:
{
  fonts = with pkgs; [
    dejavu_fonts
    liberation_ttf
    nerd-fonts.jetbrains-mono
    noto-fonts-emoji
  ];

  groups = [
    "audio"
    "video"
  ];

  packages = with pkgs; [
    adwaita-icon-theme
    adw-gtk3
    brightnessctl
    foot
    fuzzel
    gnome-multi-writer
    gnome-text-editor
    hyprpicker
    libnotify
    loupe
    mako
    nautilus
    papirus-icon-theme
    pavucontrol
    playerctl
    swaybg
    wf-recorder
    wl-clipboard
    wl-mirror
    xdg-utils
  ];

  programs = {
    dconf.enable = true;
    gnome-disks.enable = true;

    gtklock = {
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

    nm-applet.enable = true;

    waybar = {
      enable = true;
      systemd.target = config.wayland.systemd.target;
    };

    xwayland.enable = true;
  };

  services = {
    blueman.enable = config.hardware.bluetooth.enable;
    displayManager.gdm.enable = true;

    dbus = {
      enable = true;
      packages = with pkgs; [
        gcr_4
        mako
      ];
    };

    gvfs.enable = true;

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    polkit.enable = true;

    swayidle = {
      enable = true;

      events = [
        {
          event = "before-sleep";
          command = "${pkgs.gtklock}/bin/gtklock -d";
        }
      ];

      timeouts = [
        {
          timeout = 300;
          command = "${pkgs.gtklock}/bin/gtklock -d";
        }
        {
          timeout = 1800;
          command = "${pkgs.systemd}/bin/systemctl suspend";
        }
      ];
    };

    swayosd.enable = true;
    tumbler.enable = true;

    wlsunset = {
      enable = true;
      args = [
        "-L"
        "17.64"
        "-l"
        "59.85"
        "-T"
        "6500"
        "-t"
        "4500"
      ];
    };
  };

  sessionVariables = {
    _JAVA_AWT_WM_NONREPARENTING = "1";
    NIXOS_OZONE_WL = "1";
    QT_QPA_PLATFORM = "wayland";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    SDL_VIDEODRIVER = "wayland";
  };
}
