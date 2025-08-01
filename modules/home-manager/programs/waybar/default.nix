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
        height = 32;
        spacing = 0;
        modules-left = [
          "sway/workspaces"
          "sway/mode"
          "sway/window"
        ];
        modules-right = [
          "tray"
          "power-profiles-daemon"
          "sway/language"
          "backlight"
          "network"
          "pulseaudio"
          "battery"
          "clock"
        ];
        "sway/workspaces" = {
          disable-scroll = true;
        };
        "sway/window" = {
          max-length = 100;
        };
        "sway/language" = {
          format = "  {short}";
          tooltip-format = "Language: {long}";
          on-click = "${pkgs.sway}/bin/swaymsg input type:keyboard xkb_switch_layout next";
        };
        tray = {
          spacing = 8;
        };
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
          format-plugged = " {capacity}%";
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
          format-wifi = "  {essid}";
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
      }

      window#waybar {
          background: transparent
      }

      window > box {
          margin: 8px 8px 0px 8px;
          background: ${config.colorscheme.statusline.background};
          color: ${config.colorscheme.statusline.foreground};
          padding: 4px;
          border-radius: 8px;
      }

      window#waybar #window {
          padding: 0 12px;
      }

      #workspaces button {
          color: ${config.colorscheme.statusline.foreground};
          padding: 0px 6px;
          margin: 0 2px;
          border: none;
          border-radius: 8px;
          transition: none;
      }

      #workspaces button:hover {
          background: ${config.colorscheme.bright-white};
          color: ${config.colorscheme.statusline.background};
          box-shadow: inherit;
          text-shadow: inherit;
      }

      #workspaces button.focused {
          background: ${config.colorscheme.blue};
          color: ${config.colorscheme.statusline.background};
          font-weight: bold;
      }

      #workspaces button.focued:hover {
          background: ${config.colorscheme.blue};
          box-shadow: inherit;
          text-shadow: inherit;
          background-color: ${config.colorscheme.bright-black};
      }

      #mode {
          background-color: ${config.colorscheme.yellow};
          color: ${config.colorscheme.statusline.background};
          padding: 0 8px;
          margin: 0 0 0 8px;
          border-radius: 8px;
      }

      #tray,
      #language,
      #network,
      #backlight,
      #pulseaudio,
      #battery,
      #clock {
          padding: 0 8px;
      }

      #power-profiles-daemon {
          padding-left: 8px;
          padding-right: 16px;
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
