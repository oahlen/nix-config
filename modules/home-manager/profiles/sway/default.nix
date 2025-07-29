{
  config,
  hm-modules,
  lib,
  pkgs,
  ...
}: let
  grim = "${pkgs.grim}/bin/grim";
  slurp = "${pkgs.slurp}/bin/slurp";
  swaylock = "${pkgs.swaylock}/bin/swaylock -fF";
in {
  imports = [
    "${hm-modules}/programs/foot"
    "${hm-modules}/programs/fuzzel"
    "${hm-modules}/programs/swaylock"
    "${hm-modules}/programs/waybar"
    "${hm-modules}/services/mako"
    "${hm-modules}/services/swayidle"
    "${hm-modules}/services/wl-sunset"
  ];

  wayland.systemd.target = "sway-session.target";

  home.pointerCursor.sway.enable = true;

  programs.fuzzel.settings.main.launch-prefix = "${pkgs.sway}/bin/swaymsg exec --";

  scripts = {
    password-picker.enable = true;
    theme-switcher.enable = true;
    wl-logout.enable = true;
  };

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
          bg = "${config.wallpaper} fit ${config.colorscheme.background}";
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
        inner = 10;
      };

      keybindings = let
        modifier = config.wayland.windowManager.sway.config.modifier;
      in
        pkgs.lib.mkOptionDefault {
          "${modifier}+Alt+l" = "exec ${swaylock}";
          "Ctrl+Alt+Delete" = "exec wl-logout";
          "${modifier}+p" = "exec password-picker \"${pkgs.fuzzel}/bin/fuzzel -d\"";
          "${modifier}+o" = "exec theme-switcher";
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
          border = config.colorscheme.blue;
          background = config.colorscheme.blue;
          text = config.colorscheme.black;
          indicator = config.colorscheme.blue;
          childBorder = config.colorscheme.blue;
        };

        focusedInactive = {
          border = config.colorscheme.statusline.foreground;
          background = config.colorscheme.statusline.foreground;
          text = config.colorscheme.black;
          indicator = config.colorscheme.statusline.foreground;
          childBorder = config.colorscheme.statusline.foreground;
        };

        unfocused = {
          border = config.colorscheme.statusline.inactive;
          background = config.colorscheme.statusline.inactive;
          text = config.colorscheme.statusline.foreground;
          indicator = config.colorscheme.statusline.inactive;
          childBorder = config.colorscheme.statusline.inactive;
        };
      };

      bars = [];
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
          text = config.colorscheme.black;
          background = config.colorscheme.blue;
          button-text = config.colorscheme.black;
          button-background = config.colorscheme.blue;
          details-background = config.colorscheme.blue;
        };
        warning = {
          text = config.colorscheme.black;
          background = config.colorscheme.yellow;
          button-text = config.colorscheme.black;
          button-background = config.colorscheme.yellow;
          details-background = config.colorscheme.yellow;
        };
        error = {
          text = config.colorscheme.black;
          background = config.colorscheme.red;
          button-text = config.colorscheme.black;
          button-background = config.colorscheme.red;
          details-background = config.colorscheme.red;
        };
      };
    };
  };
}
