{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  name = "password-picker";
in {
  options.scripts.password-picker.enable = mkEnableOption name;

  config = mkIf config.scripts.password-picker.enable {
    home.packages = with pkgs; let
      package = writeShellApplication {
        name = name;
        runtimeInputs = [
          fzf
          rbw
          wl-clipboard
        ];
        text = builtins.readFile ./${name};
      };
    in [package];

    programs.fish.shellAliases = {
      pw = "password-picker";
    };
  };
}
