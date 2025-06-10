{...}: {
  programs.jq = {
    enable = true;

    colors = {
      arrays = "0;37";
      false = "0;33";
      null = "1;33";
      numbers = "0;33";
      objectKeys = "1;34";
      objects = "0;37";
      strings = "0;32";
      true = "0;33";
    };
  };
}
