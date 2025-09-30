{config, ...}: {
  programs.waybar = {
    enable = true;
    systemd.enable = true;

    settings.mainBar = {
      layer = "top";
      position = "top";
      height = 32;
      spacing = 0;

      modules-center = [
        "clock"
      ];

      modules-right = [
        "group/expander"
        "tray"
        "battery"
        "pulseaudio"
        "custom/power"
      ];

      clock = {
        format = "{:%Y-%m-%d %H:%M}";
        tooltip = false;
      };

      "group/expander" = {
        orientation = "inherit";
        drawer = {
          transition-duration = 250;
          children-class = "expander-group-item";
        };
        modules = [
          "custom/expand-icon"
          "custom/color-picker"
          "power-profiles-daemon"
        ];
      };

      "custom/expand-icon" = {
        format = " ";
        tooltip = false;
      };

      "custom/color-picker" = {
        format = "";
        on-click = "hyprpicker -a";
        on-click-right = "hyprpicker -a -f hsl";
        tooltip-format = "Color Picker";
      };

      power-profiles-daemon = {
        format = "{icon}";
        format-icons = {
          "default" = "";
          "performance" = "";
          "balanced" = "";
          "power-saver" = "";
        };
        tooltip-format = "Power profile: {profile}";
      };

      battery = {
        states = {
          warning = 30;
          critical = 15;
        };
        format = "{icon}";
        format-plugged = "";
        format-icons = {
          charging = [
            "󰢜"
            "󰂆"
            "󰂇"
            "󰂈"
            "󰢝"
            "󰂉"
            "󰢞"
            "󰂊"
            "󰂋"
            "󰂅"
          ];
          default = [
            "󰁺"
            "󰁻"
            "󰁼"
            "󰁽"
            "󰁾"
            "󰁿"
            "󰂀"
            "󰂁"
            "󰂂"
            "󰁹"
          ];
        };
        format-full = "󰂅";
        tooltip-format-discharging = "{power:>1.0f}W ↓ {capacity}%";
        tooltip-format-charging = "{power:>1.0f}W ↑ {capacity}%";
        interval = 15;
      };

      pulseaudio = {
        format = "{icon}";
        on-click = "pavucontrol";
        tooltip-format = "Playing at {volume}%";
        scroll-step = 5;
        format-muted = "";
        format-icons = {
          default = [
            " "
            " "
            " "
          ];
        };
      };

      "custom/power" = {
        format = "⏻";
        tooltip = false;
        menu = "on-click";
        menu-file = "${./power_menu.xml}";
        menu-actions = {
          shutdown = "systemctl poweroff";
          suspend = "systemctl suspend";
          reboot = "systemctl reboot";
        };
      };

      tray = {
        spacing = 12;
      };
    };

    style = ''
      * {
          font-family: "${config.font.name}";
          font-size: 15px;
      }

      window#waybar {
          background: transparent
      }

      window > box {
          margin: 8px 8px 0px 8px;
          background: ${config.colors.background};
          color: ${config.colors.foreground};
          padding: 4px;
          border-radius: 8px;
      }

      #workspaces button {
          color: ${config.colors.foreground};
          padding: 0px 6px;
          margin: 0 2px;
          border: none;
          border-radius: 8px;
          transition: none;
      }

      #workspaces button:hover {
          background: ${config.colors.bright-white};
          color: ${config.colors.background};
          box-shadow: inherit;
          text-shadow: inherit;
      }

      #workspaces button.focused {
          background: ${config.colors.blue};
          color: ${config.colors.background};
          font-weight: bold;
      }

      #workspaces button.focused:hover {
          background: ${config.colors.bright-white};
          box-shadow: inherit;
          text-shadow: inherit;
      }

      #mode {
          background: ${config.colors.yellow};
          color: ${config.colors.background};
          padding: 0 8px;
          margin: 0 0 0 8px;
          border-radius: 8px;
      }

      #clock {
          font-weight: bold;
      }

      #tray {
          padding: 0 6px;
      }

      #custom-expand-icon,
      #custom-color-picker,
      #power-profiles-daemon,
      #battery,
      #pulseaudio,
      #custom-power
      {
          color: #DFDFDF;
      }

      #custom-expand-icon {
          font-size: 18px;
          padding-right: 2px;
      }

      #custom-color-picker {
          font-size: 16px;
          padding: 0 16px 0 6px;
      }

      #power-profiles-daemon {
          font-size: 16px;
          padding: 0 16px 0 4px;
      }

      #battery,
      #pulseaudio {
          font-size: 18px;
          padding: 0 8px;
      }

      #custom-power {
        font-size: 16px;
        padding: 0 12px 0 4px;
      }

      #battery.charging,
      #battery.plugged {
          color: ${config.colors.green};
      }

      #battery.warning {
          color: ${config.colors.yellow};
      }

      #battery.critical {
          color: ${config.colors.red};
      }

      tooltip {
          background: ${config.colors.background};
          border: 2px solid ${config.colors.blue};
          border-radius: 8px;
      }

      tooltip label {
          color: ${config.colors.foreground};
      }
    '';
  };
}
