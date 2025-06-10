{...}: {
  programs.yazi = {
    enable = true;

    settings = {
      manager = {
        show_hidden = true;
        sort_dir_first = true;
      };
    };

    theme = {
      manager = {
        cwd = {
          fg = "Yellow";
        };
        border_style = {
          fg = "DarkGray";
        };
        count_copied = {
          fg = "Black";
          bg = "Green";
        };
        count_cut = {
          fg = "Black";
          bg = "Red";
        };
        count_selected = {
          fg = "Black";
          bg = "Yellow";
        };
        syntect_theme = "~/.config/bat/themes/base16.tmTheme";
      };

      mode = {
        normal_main = {
          fg = "Black";
          bg = "Blue";
          bold = true;
        };
        normal_alt = {
          fg = "Black";
          bg = "DarkGray";
        };
        select_main = {
          fg = "Black";
          bg = "Green";
          bold = true;
        };
        select_alt = {
          fg = "Black";
          bg = "DarkGray";
        };
        unset_main = {
          fg = "Black";
          bg = "Yellow";
          bold = true;
        };
        unset_alt = {
          fg = "Black";
          bg = "DarkGray";
        };
      };

      status = {
        overall = {
          fg = "White";
          bg = "Black";
        };
      };
    };
  };
}
