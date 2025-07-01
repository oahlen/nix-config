{lib, ...}: {
  options.colorscheme = lib.mkOption {
    type = lib.types.attrs;
    default = import ./tokyonight-dark.nix;
  };
}
