{
  config,
  ...
}: {
  programs.waybar = {
    enable = true;
    systemd.enable = true;

    settings.mainBar = {
      layer = "top";
      position = "top";
      height = 32;
      spacing = 0;

      clock = {
        format = "{:%Y-%m-%d %H:%M}";
        tooltip = false;
      };

      tray = {
        spacing = 12;
      };

      battery = {
        states = {
          warning = 30;
          critical = 15;
        };
        format = "{icon} {capacity}%";
        format-time = "{H} hr {M} min";
        format-icons = [
          "󰂎"
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
        format-charging = "󰉁 {capacity}%";
        min-length = 7;
        max-length = 7;
        tooltip-format = "Discharging: {time}";
        tooltip-format-charging = "Charging: {time}";
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
          background: ${config.colors.statusline.background};
          color: ${config.colors.statusline.foreground};
          padding: 4px;
          border-radius: 8px;
      }

      window#waybar #window {
          padding: 0 12px;
      }

      #workspaces button {
          color: ${config.colors.statusline.foreground};
          padding: 0px 6px;
          margin: 0 2px;
          border: none;
          border-radius: 8px;
          transition: none;
      }

      #workspaces button:hover {
          background: ${config.colors.bright-white};
          color: ${config.colors.statusline.background};
          box-shadow: inherit;
          text-shadow: inherit;
      }

      #workspaces button.focused {
          background: ${config.colors.blue};
          color: ${config.colors.statusline.background};
          font-weight: bold;
      }

      #workspaces button.focued:hover {
          background: ${config.colors.blue};
          box-shadow: inherit;
          text-shadow: inherit;
          background-color: ${config.colors.bright-black};
      }

      #mode {
          background-color: ${config.colors.yellow};
          color: ${config.colors.statusline.background};
          padding: 0 8px;
          margin: 0 0 0 8px;
          border-radius: 8px;
      }

      #battery,
      #tray {
          padding: 0 8px;
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
          color: ${config.colors.statusline.foreground};
      }
    '';
  };
}
