{user, ...}: {
  programs.waybar = {
    enable = true;
    systemd.enable = true;

    settings = [
      {
        layer = "top";
        position = "top";
        height = 24;
        spacing = 5;
        modules-left = [
          "sway/workspaces"
        ];
        modules-center = [
          "sway/window"
        ];
        modules-right = [
          "power-profiles-daemon"
          "backlight"
          "pulseaudio"
          "network"
          "battery"
          "clock"
          "tray"
        ];
        power-profiles-daemon = {
          format = "{icon}";
          tooltip-format = "Power profile: {profile}\nDriver: {driver}";
          format-icons = {
            "default" = "";
            "performance" = "";
            "balanced" = "";
            "power-saver" = "";
          };
        };
        clock = {
          format = "{:%Y-%m-%d %H:%M}";
          tooltip = false;
        };
        backlight = {
          format = "{icon} {percent}%";
          format-icons = [
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
          ];
          scroll-step = 5;
        };
        battery = {
          states = {
            normal = 75;
            warning = 30;
            critical = 15;
          };
          format = "{icon}  {capacity}%";
          format-charging = "";
          format-plugged = "";
          tooltip-format = "Capacity: {capacity}%\nEstimated time left: {time}";
          format-icons = [
            ""
            ""
            ""
            ""
            ""
          ];
        };
        network = {
          format-wifi = "  {essid}";
          format-ethernet = "󰈀";
          tooltip-format = "{essid}";
          format-linked = "󰈂";
          format-disconnected = "󰈂";
          on-click = "iwgtk";
        };
        pulseaudio = {
          scroll-step = 5;
          format = "{icon}  {volume}%";
          format-muted = " ";
          format-icons = {
            default = [
              ""
              ""
              ""
            ];
          };
          on-click = "pavucontrol";
        };
      }
    ];

    style = ''
      * {
          font-family: "JetBrainsMono Nerd Font";
          font-size: 15px;
          border: none;
          border-radius: 0;
      }

      window#waybar {
          background: ${user.colorscheme.statusline.background};
          color: ${user.colorscheme.statusline.foreground};
      }

      #workspaces button {
          background-color: ${user.colorscheme.statusline.inactive};
          color: ${user.colorscheme.statusline.foreground};
          padding: 0 7px;
      }

      #workspaces button.focused {
          background: ${user.colorscheme.blue};

          color: #15161e;
          font-weight: bold;
      }

      #workspaces button:hover {
          box-shadow: inherit;
          text-shadow: inherit;
          background-color: ${user.colorscheme.bright-black};
      }

      #power-profiles-daemon,
      #network,
      #backlight,
      #pulseaudio,
      #battery,
      #clock {
          padding: 0 8px;
      }

      #battery,
      #battery.charging,
      #battery.plugged {
          color: ${user.colorscheme.green};
      }

      #battery.normal {
          color: ${user.colorscheme.statusline.foreground};
      }

      #battery.warning {
          color: ${user.colorscheme.yellow};
      }

      #battery.critical {
          color: ${user.colorscheme.red};
      }

      tooltip {
          background: ${user.colorscheme.background};
          border: 1px solid ${user.colorscheme.bright-black};
          border-radius: 0.25rem;
      }

      tooltip label {
          color: ${user.colorscheme.statusline.foreground};
      }
    '';
  };
}
