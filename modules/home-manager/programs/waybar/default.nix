{
  config,
  pkgs,
  ...
}: {
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
          "tray"
          "power-profiles-daemon"
          "backlight"
          "network"
          "pulseaudio"
          "battery"
          "clock"
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
          format-charging = " {capacity}%";
          format-plugged = "";
          tooltip-format = "Capacity: {capacity}%\nEstimated time left: {time}\nDraw: {power}w";
          format-icons = [
            ""
            ""
            ""
            ""
            ""
          ];
        };
        network = {
          format = "{ifname}";
          format-wifi = " ";
          format-ethernet = "󰈀";
          format-linked = "󰈂";
          format-disconnected = "󰈂";
          tooltip-format-wifi = "Network: {essid} ({signalStrength}%)\nIP: {ipaddr}";
          tooltip-format-ethernet = "Interface: {ifname}\nIP: {ipaddr}";
          tooltip-format-linked = "Disconnected";
          on-click = "${pkgs.iwgtk}/bin/iwgtk";
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
          on-click = "${pkgs.pavucontrol}/bin/pavucontrol";
        };
      }
    ];

    style = ''
      * {
          font-family: "${config.font.name}";
          font-size: 15px;
          border: none;
          border-radius: 0;
      }

      window#waybar {
          background: ${config.colorscheme.statusline.background};
          color: ${config.colorscheme.statusline.foreground};
      }

      #workspaces button {
          background-color: ${config.colorscheme.statusline.inactive};
          color: ${config.colorscheme.statusline.foreground};
          padding: 0 7px;
      }

      #workspaces button.focused {
          background: ${config.colorscheme.blue};

          color: #15161e;
          font-weight: bold;
      }

      #workspaces button:hover {
          box-shadow: inherit;
          text-shadow: inherit;
          background-color: ${config.colorscheme.bright-black};
      }

      #tray,
      #power-profiles-daemon,
      #network,
      #backlight,
      #pulseaudio,
      #battery,
      #clock {
          padding: 0 8px;
      }

      #battery,
      #battery.charging {
          color: ${config.colorscheme.green};
      }

      #battery.normal,
      #battery.plugged {
          color: ${config.colorscheme.statusline.foreground};
      }

      #battery.warning {
          color: ${config.colorscheme.yellow};
      }

      #battery.critical {
          color: ${config.colorscheme.red};
      }

      tooltip {
          background: ${config.colorscheme.background};
          border: 1px solid ${config.colorscheme.bright-black};
          border-radius: 0.25rem;
      }

      tooltip label {
          color: ${config.colorscheme.statusline.foreground};
      }
    '';
  };
}
