{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  name = "markdown-viewer";
in {
  options.scripts.markdown-viewer.enable = mkEnableOption name;

  config = mkIf config.scripts.markdown-viewer.enable {
    home.packages = with pkgs; let
      package = writeShellApplication {
        name = name;
        runtimeInputs = [
          fzf
          lowdown
        ];
        text = builtins.readFile ./${name};
      };
    in [package];

    programs.fish.shellAliases = {
      md = "markdown-viewer";
    };
  };
}
