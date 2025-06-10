{...}: {
  programs.bottom = {
    enable = true;

    settings = {
      flags = {
        group_processes = true;
        process_memory_as_value = true;
      };

      styles = {
        cpu = {
          all_entry_color = "green";
          avg_entry_color = "reset";
          cpu_core_colors = ["red" "green" "yellow" "blue" "magenta" "cyan" "light red" "light green" "light yellow" "light blue" "light magenta" "light cyan"];
        };

        memory = {
          ram_color = "light magenta";
          cache_color = "light red";
          swap_color = "light yellow";
          arc_color = "light cyan";
          gpu_colors = ["light blue" "light red" "cyan" "green" "blue" "red"];
        };

        network = {
          rx_color = "green";
          tx_color = "cyan";
          rx_total_color = "light cyan";
          tx_total_color = "light green";
        };

        battery = {
          high_battery_color = "green";
          medium_battery_color = "yellow";
          low_battery_color = "red";
        };

        tables = {
          headers = "blue";
        };

        graphs = {
          graph_color = "reset";
          legend_text = "reset";
        };

        widgets = {
          border_color = "dark gray";
          selected_border_color = "blue";
          widget_title = "white";
          text = "reset";
          selected_text = {
            color = "black";
            bg_color = "blue";
          };
          disabled_text = "dark gray";
        };
      };

      row = [
        {
          ratio = 30;
          child = [
            {
              type = "cpu";
            }
          ];
        }
        {
          ratio = 40;
          child = [
            {
              ratio = 4;
              type = "proc";
              default = true;
            }
            {
              ratio = 3;
              child = [
                {
                  type = "temp";
                }
                {
                  type = "disk";
                }
              ];
            }
          ];
        }
        {
          ratio = 30;
          child = [
            {
              type = "net";
            }
            {
              type = "mem";
            }
          ];
        }
      ];
    };
  };
}
