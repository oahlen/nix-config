{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.modules.pipewire;
in {
  options.modules.pipewire.enable = mkEnableOption "Enable pipewire";

  config = mkIf cfg.enable {
    services = {
      pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
      };

      pulseaudio.enable = false;
    };

    security.rtkit.enable = true;
  };
}
