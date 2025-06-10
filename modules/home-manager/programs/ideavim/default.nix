{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.programs.ideavim;
in {
  options.programs.ideavim = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = mdDoc ''
        Whether to enable ideavim
      '';
    };
  };

  config = mkIf cfg.enable {
    xdg.configFile."ideavim/ideavimrc".source = ./.ideavimrc;
  };
}
