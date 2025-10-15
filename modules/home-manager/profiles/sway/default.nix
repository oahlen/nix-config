{
  config,
  hm-modules,
  lib,
  pkgs,
  ...
}: {
  imports = [
    "${hm-modules}/services/swayosd"
    "${hm-modules}/services/wl-sunset"
  ];

  wayland.systemd.target = "sway-session.target";

  home.pointerCursor.sway.enable = true;

  wayland.windowManager.sway = {
    enable = true;

    systemd = {
      enable = true;
      dbusImplementation = "broker";
      xdgAutostart = true;
    };

    wrapperFeatures = {
      base = true;
      gtk = true;
    };

    xwayland = true;

    config = {
      fonts = {
        names = [config.font.name];
        size = config.font.size;
      };

      input = {
        "type:keyboard" = {
          xkb_layout = "se,us";
          xkb_options = "caps:escape,grp:win_space_toggle";
          repeat_delay = "250";
          repeat_rate = "40";
        };

        "type:touchpad" = {
          tap = "enabled";
          natural_scroll = "enabled";
          dwt = "enabled";
        };
      };

      output = {
        "*" = {
          bg = "${config.wallpaper} fit ${config.colors.background}";
        };
      };

      modifier = "Mod4";

      terminal = "foot";

      menu = "fuzzel";

      defaultWorkspace = "workspace number 1";

      window = {
        border = 2;
        # hideEdgeBorders = "smart";
        titlebar = false;

        commands = [
          {
            command = "resize set 1000 600";
            criteria = {
              app_id = "pavucontrol";
            };
          }
          {
            command = "resize set 1000 600";
            criteria = {
              app_id = "iwgtk";
            };
          }
        ];
      };

      floating = {
        titlebar = false;

        criteria = [
          {
            app_id = "pavucontrol";
          }
          {
            app_id = "iwgtk";
          }
        ];
      };

      gaps = {
        inner = 8;
      };

      keybindings = let
        modifier = config.wayland.windowManager.sway.config.modifier;
      in
        pkgs.lib.mkOptionDefault {
          "${modifier}+Alt+l" = "exec gtklock";
          "Ctrl+Alt+Delete" = "exec wl-logout";
          "${modifier}+p" = "exec password-picker \"${pkgs.fuzzel}/bin/fuzzel -d\"";
          "${modifier}+o" = "exec theme-switcher";
          "Print" = "exec grim ~/Pictures/$(date +\"%Y-%m-%d-%H-%M-%S\").png";
          "${modifier}+Print" = "exec slurp | grim -g - ~/Pictures/$(date +\"%Y-%m-%d-%H-%M-%S\").png";
          "${modifier}+x" = "split none";
          "${modifier}+Tab" = "workspace next";
          "${modifier}+Shift+Tab" = "workspace prev";
        };

      modes = {
        resize = {
          Left = "resize shrink width 32 px";
          Right = "resize grow width 32 px";
          Up = "resize shrink height 32 px";
          Down = "resize grow height 32 px";
          h = "resize shrink width 32 px";
          j = "resize grow height 32 px";
          k = "resize shrink height 32 px";
          l = "resize grow width 32 px";
          Return = "mode default";
          Escape = "mode default";
        };
      };

      colors = {
        focused = {
          border = config.colors.blue;
          background = config.colors.blue;
          text = config.colors.black;
          indicator = config.colors.blue;
          childBorder = config.colors.blue;
        };

        focusedInactive = {
          border = config.colors.foreground;
          background = config.colors.foreground;
          text = config.colors.black;
          indicator = config.colors.foreground;
          childBorder = config.colors.foreground;
        };

        unfocused = {
          border = config.colors.black;
          background = config.colors.black;
          text = config.colors.foreground;
          indicator = config.colors.black;
          childBorder = config.colors.black;
        };
      };

      bars = [];
    };

    extraConfig = ''
      # Inhibit swayidle when fullscreen
      for_window [shell=".*"] inhibit_idle fullscreen

      # Screen brightness
      bindsym --locked XF86MonBrightnessUp exec swayosd-client --brightness raise
      bindsym --locked XF86MonBrightnessDown exec swayosd-client --brightness lower

      # Volume control
      bindsym --locked XF86AudioRaiseVolume exec swayosd-client --output-volume raise
      bindsym --locked XF86AudioLowerVolume exec swayosd-client --output-volume lower
      bindsym --locked XF86AudioMute exec swayosd-client --output-volume mute-toggle
      bindsym --locked XF86AudioMicMute exec swayosd-client --input-volume mute-toggle

      # Multimedia
      bindsym --locked XF86AudioPlay exec playerctl play
      bindsym --locked XF86AudioPause exec playerctl pause
      bindsym --locked XF86AudioNext exec playerctl next
      bindsym --locked XF86AudioPrev exec playerctl previous

      titlebar_padding 10 2
    '';

    swaynag = {
      enable = true;

      settings = {
        "<config>" = {
          font = "${config.font.name} ${lib.strings.floatToString config.font.size}";
          edge = "bottom";

          border-bottom-size = 0;
          details-border-size = 0;

          message-padding = 8;

          button-border-size = 0;
          button-padding = 6;
          button-margin-right = 6;
          button-dismiss-gap = 0;
        };
        info = {
          text = config.colors.black;
          background = config.colors.blue;
          button-text = config.colors.black;
          button-background = config.colors.blue;
          details-background = config.colors.blue;
        };
        warning = {
          text = config.colors.black;
          background = config.colors.yellow;
          button-text = config.colors.black;
          button-background = config.colors.yellow;
          details-background = config.colors.yellow;
        };
        error = {
          text = config.colors.black;
          background = config.colors.red;
          button-text = config.colors.black;
          button-background = config.colors.red;
          details-background = config.colors.red;
        };
      };
    };
  };
}
