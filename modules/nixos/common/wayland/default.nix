{pkgs, ...}: {
  environment.sessionVariables = {
    _JAVA_AWT_WM_NONREPARENTING = "1";
    NIXOS_OZONE_WL = "1";
    QT_QPA_PLATFORM = "wayland";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    SDL_VIDEODRIVER = "wayland";
  };

  # General overrides
  services.dbus.implementation = "broker";

  # X11 settings
  services.xserver = {
    excludePackages = with pkgs; [xterm];
  };
}
