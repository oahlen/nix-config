{...}: {
  programs.fzf = {
    enable = true;

    defaultCommand = "fd --type f --hidden --follow";

    defaultOptions = [
      "--layout=reverse"
      "--height=40%"
      "--scrollbar '▌'"
    ];

    colors = {
      "fg+" = "15";
      "bg+" = "0";
      hl = "3";
      "hl+" = "3";
      header = "4";
      info = "8";
      border = "7";
      separator = "8";
      gutter = "0";
      prompt = "2";
      pointer = "3";
      marker = "6";
      spinner = "5";
      scrollbar = "8";
    };
  };
}
