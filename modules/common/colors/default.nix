{lib, ...}: {
  options.colors = lib.mkOption {
    type = lib.types.attrs;
    default = import ./tokyonight-dark.nix;
  };
}
