{
  config,
  hm-modules,
  lib,
  pkgs,
  user,
  ...
}: let
  grim = "${pkgs.grim}/bin/grim";
  slurp = "${pkgs.slurp}/bin/slurp";
  swaylock = "${pkgs.swaylock}/bin/swaylock";
in {
  imports = [
    "${hm-modules}/programs/foot"
    "${hm-modules}/programs/fuzzel"
    "${hm-modules}/programs/i3status-rust"
    "${hm-modules}/programs/swaylock"
    "${hm-modules}/services/mako"
    "${hm-modules}/services/swayidle"
    "${hm-modules}/services/wl-sunset"
  ];

  # Consistent cursor theme across all applications.
  home.pointerCursor = {
    name = "Adwaita";
    package = pkgs.adwaita-icon-theme;
    gtk.enable = true;
    sway.enable = true;
    x11.enable = true;
    size = 24;
  };

  programs.fuzzel.settings.main.launch-prefix = "${pkgs.sway}/bin/swaymsg exec --";

  scripts.password-picker.enable = true;
  scripts.wl-logout.enable = true;

  wayland.windowManager.sway = {
    enable = true;

    systemd.enable = true;

    wrapperFeatures = {
      base = true;
      gtk = true;
    };

    xwayland = true;

    config = {
      fonts = {
        names = [user.font.name];
        size = user.font.size;
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
          bg = "${user.wallpaper} fit ${user.colorscheme.background}";
        };
      };

      startup = [
        {
          command = "${pkgs.mako}/bin/mako";
        }
      ];

      modifier = "Mod4";

      terminal = "${pkgs.foot}/bin/foot";

      menu = "${pkgs.fuzzel}/bin/fuzzel";

      defaultWorkspace = "workspace number 1";

      window = {
        border = 1;
        hideEdgeBorders = "smart";
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

      keybindings = let
        modifier = config.wayland.windowManager.sway.config.modifier;
      in
        pkgs.lib.mkOptionDefault {
          "${modifier}+Alt+l" = "exec ${swaylock} -fF";
          "Ctrl+Alt+Delete" = "exec wl-logout";
          "${modifier}+p" = "exec password-picker \"${pkgs.fuzzel}/bin/fuzzel -d\"";
          "Print" = "exec ${grim} ~/Pictures/$(date +\"%Y-%m-%d-%H-%M-%S\").png";
          "${modifier}+Print" = "exec ${slurp} | ${grim} -g - ~/Pictures/$(date +\"%Y-%m-%d-%H-%M-%S\").png";
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
          border = user.colorscheme.blue;
          background = user.colorscheme.blue;
          text = user.colorscheme.black;
          indicator = user.colorscheme.blue;
          childBorder = user.colorscheme.blue;
        };

        focusedInactive = {
          border = user.colorscheme.statusline.foreground;
          background = user.colorscheme.statusline.foreground;
          text = user.colorscheme.black;
          indicator = user.colorscheme.statusline.foreground;
          childBorder = user.colorscheme.statusline.foreground;
        };

        unfocused = {
          border = user.colorscheme.statusline.inactive;
          background = user.colorscheme.statusline.inactive;
          text = user.colorscheme.statusline.foreground;
          indicator = user.colorscheme.statusline.inactive;
          childBorder = user.colorscheme.statusline.inactive;
        };
      };

      bars = [
        {
          command = "${pkgs.sway}/bin/swaybar";
          statusCommand = "${pkgs.i3status-rust}/bin/i3status-rs ~/.config/i3status-rust/config-default.toml";
          position = "top";

          fonts = {
            names = [user.font.name];
            size = user.font.size;
          };

          extraConfig = ''
            position top
            height 24
            workspace_min_width 30
            status_padding 0
            status_edge_padding 0
          '';

          colors = {
            background = user.colorscheme.statusline.background;
            statusline = user.colorscheme.statusline.foreground;
            separator = user.colorscheme.statusline.foreground;

            focusedWorkspace = {
              border = user.colorscheme.blue;
              background = user.colorscheme.blue;
              text = user.colorscheme.black;
            };

            activeWorkspace = {
              border = user.colorscheme.statusline.foreground;
              background = user.colorscheme.statusline.foreground;
              text = user.colorscheme.black;
            };

            inactiveWorkspace = {
              border = user.colorscheme.statusline.inactive;
              background = user.colorscheme.statusline.inactive;
              text = user.colorscheme.statusline.foreground;
            };

            urgentWorkspace = {
              border = user.colorscheme.red;
              background = user.colorscheme.red;
              text = user.colorscheme.black;
            };

            bindingMode = {
              border = user.colorscheme.yellow;
              background = user.colorscheme.yellow;
              text = user.colorscheme.black;
            };
          };
        }
      ];
    };

    extraConfig = ''
      # Inhibit swayidle when fullscreen
      for_window [shell=".*"] inhibit_idle fullscreen

      # Screen brightness
      bindsym --locked XF86MonBrightnessUp exec brightnessctl set +5%
      bindsym --locked XF86MonBrightnessDown exec brightnessctl set 5%-

      # Volume control
      bindsym --locked XF86AudioRaiseVolume exec wpctl set-volume @DEFAULT_SINK@ .05+
      bindsym --locked XF86AudioLowerVolume exec wpctl set-volume @DEFAULT_SINK@ .05-
      bindsym --locked XF86AudioMute exec wpctl set-mute @DEFAULT_SINK@ toggle

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
          font = "${user.font.name} ${lib.strings.floatToString user.font.size}";
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
          text = user.colorscheme.black;
          background = user.colorscheme.blue;
          button-text = user.colorscheme.black;
          button-background = user.colorscheme.blue;
          details-background = user.colorscheme.blue;
        };
        warning = {
          text = user.colorscheme.black;
          background = user.colorscheme.yellow;
          button-text = user.colorscheme.black;
          button-background = user.colorscheme.yellow;
          details-background = user.colorscheme.yellow;
        };
        error = {
          text = user.colorscheme.black;
          background = user.colorscheme.red;
          button-text = user.colorscheme.black;
          button-background = user.colorscheme.red;
          details-background = user.colorscheme.red;
        };
      };
    };
  };
}
