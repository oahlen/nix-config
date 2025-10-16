{ pkgs }:
{
  fonts = with pkgs; [
    dejavu_fonts
    liberation_ttf
    nerd-fonts.jetbrains-mono
    noto-fonts-emoji
  ];

  gtklock = {
    enable = true;

    config = {
      main = {
        gtk-theme = "adw-gtk3-dark";
        idle-hide = true;
        idle-timeout = 10;
      };
    };

    modules = with pkgs; [
      gtklock-playerctl-module
      gtklock-powerbar-module
      gtklock-userinfo-module
    ];
  };

  pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  sessionVariables = {
    _JAVA_AWT_WM_NONREPARENTING = "1";
    NIXOS_OZONE_WL = "1";
    QT_QPA_PLATFORM = "wayland";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    SDL_VIDEODRIVER = "wayland";
  };
}
