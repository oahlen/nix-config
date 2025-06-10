{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  name = "op-password-picker";
in {
  options.scripts.op-password-picker.enable = mkEnableOption name;

  config = mkIf config.scripts.op-password-picker.enable {
    home.packages = with pkgs; let
      package = writeShellApplication {
        name = name;
        runtimeInputs = [
          _1password-cli
          fzf
          jq
          wl-clipboard
        ];
        text = builtins.readFile ./${name};
      };
    in [package];

    programs.fish.shellAliases = {
      opw = "op-password-picker";
      ops = "eval $(op signin)";
    };
  };
}
