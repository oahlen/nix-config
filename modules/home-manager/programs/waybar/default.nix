{
  config,
  pkgs,
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

      network = {
        interval = 10;
        format = "󰤨";
        format-ethernet = "󰈀";
        format-wifi = "{icon}";
        format-disconnected = "󰤯";
        format-disabled = "󰤮";
        format-icons = [
          "󰤟"
          "󰤢"
          "󰤥"
          "󰤨"
        ];
        min-length = 2;
        max-length = 2;
        on-click = "${pkgs.iwgtk}/bin/iwgtk";
        tooltip-format = "Gateway: {gwaddr}";
        tooltip-format-ethernet = "Interface: {ifname}";
        tooltip-format-wifi = "Network: {essid}\nIP Addr: {ipaddr}/{cidr}\nStrength: {signalStrength}%\nFrequency: {frequency} GHz";
        tooltip-format-disconnected = "Wi-Fi Disconnected";
        tooltip-format-disabled = "Wi-Fi Disabled";
      };

      bluetooth = {
        format = "󰂯";
        format-disabled = "󰂲";
        format-off = "󰂲";
        format-on = "󰂰";
        format-connected = "󰂱";
        min-length = 2;
        max-length = 2;
        # TODO Add on-click event
        tooltip-format = "Device Addr: {device_address}";
        tooltip-format-disabled = "Bluetooth Disabled";
        tooltip-format-off = "Bluetooth Off";
        tooltip-format-on = "Bluetooth Disconnected";
        tooltip-format-connected = "Device: {device_alias}";
        tooltip-format-enumerate-connected = "Device: {device_alias}";
        tooltip-format-connected-battery = "Device: {device_alias}\nBattery: {device_battery_percentage}%";
        tooltip-format-enumerate-connected-battery = "Device: {device_alias}\nBattery: {device_battery_percentage}%";
      };

      pulseaudio = {
        format = "{icon} {volume}%";
        format-muted = "󰝟 {volume}%";
        format-icons = {
          default = ["󰕿" "󰖀" "󰕾"];
          headphone = "󰋋";
          headset = "󰋋";
        };
        min-length = 7;
        max-length = 7;
        on-click = "${pkgs.pavucontrol}/bin/pavucontrol";
        tooltip-format = "Output Device: {desc}";
        scroll-step = 5;
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
        min-length = 7;
        max-length = 7;
        tooltip = false;
        scroll-step = 5;
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
        events = {
          on-discharging-warning = "notify-send 'Low Battery' '{capacity}% battery remaining'";
          on-discharging-critical = "notify-send 'Low Battery' '{capacity}% battery remaining' -u critical";
          on-charging-100 = "notify-send 'Battery full' 'Battery is at {capacity}%'";
        };
      };

      clock = {
        format = "󰸗 {:%Y-%m-%d %H:%M}";
        tooltip = false;
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

      #language,
      #bluetooth,
      #network,
      #pulseaudio,
      #battery,
      #clock {
          padding: 0 8px;
      }

      #battery.charging,
      #battery.plugged {
          color: ${config.colorscheme.green};
      }

      #battery.warning {
          color: ${config.colorscheme.yellow};
      }

      #battery.critical {
          color: ${config.colorscheme.red};
      }

      tooltip {
          background: ${config.colorscheme.background};
          border: 2px solid ${config.colorscheme.bright-black};
          border-radius: 8px;
      }

      tooltip label {
          color: ${config.colorscheme.statusline.foreground};
      }
    '';
  };
}
