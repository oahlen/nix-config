{lib, ...}: {
  options.font = {
    name = lib.mkOption {
      type = lib.types.str;
      default = "JetBrainsMono Nerd Font";
    };

    size = lib.mkOption {
      type = lib.types.float;
      default = 11.5;
    };
  };
}
