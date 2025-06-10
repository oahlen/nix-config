{user, ...}: {
  programs.i3status-rust = {
    enable = true;

    bars = {
      default = {
        icons = "none";

        settings = {
          theme = {
            theme = "native";
            overrides = {
              info_fg = user.colorscheme.cyan;
              good_fg = user.colorscheme.green;
              warning_fg = user.colorscheme.yellow;
              critical_fg = user.colorscheme.red;
              separator = " ";
            };
          };
        };

        blocks = [
          {
            block = "keyboard_layout";
            driver = "sway";
            mappings = {
              "English (US)" = "US";
              "Swedish (N/A)" = "SE";
            };
          }
          {
            block = "backlight";
            if_command = "test -e /sys/class/backlight/*backlight/";
            minimum = 5;
            maximum = 100;
            step_width = 5;
            cycle = [5 25 50 75 100];
          }
          {
            block = "sound";
            headphones_indicator = true;
            click = [
              {
                button = "left";
                cmd = "pavucontrol";
              }
            ];
          }
          {
            block = "net";
            format = " {$ssid|Wired}";
            missing_format = " No network ";
            interval = 10;
          }
          {
            block = "battery";
            device = "BAT0";
            if_command = "test -e /sys/class/power_supply/BAT0";
            format = " $icon $percentage ";
            full_format = "";
            missing_format = "";
            good = 75;
            warning = 50;
            critical = 25;
            interval = 10;
          }
          {
            block = "time";
            interval = 10;
            format = " $timestamp.datetime(f:'%Y-%m-%d %R') ";
          }
        ];
      };
    };
  };
}
