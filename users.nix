{
  oahlen = {
    name = "oahlen";
    fullName = "Oscar Ahlén";

    font = {
      name = "JetBrainsMono Nerd Font";
      size = 11.5;
    };

    no_hex = color: builtins.substring 1 (builtins.stringLength color - 1) color;
    colorscheme = import ./misc/colorschemes/tokyonight-dark.nix;

    wallpaper = ./misc/wallpaper/nixos.png;
  };
}
