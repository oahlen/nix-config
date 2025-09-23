{
  config,
  pkgs,
  ...
}: {
  programs.gtklock = {
    enable = true;

    config = {
      main = {
        gtk-theme = "adw-gtk3-dark";
        idle-hide = true;
        idle-timeout = 10;
      };
    };

    style = ''
      window {
          background-image: url("${config.wallpaper}");
          background-size: cover;
          background-repeat: no-repeat;
          background-position: center;
          background-color: ${config.colors.background};
      }
    '';

    modules = with pkgs; [
      gtklock-playerctl-module
      gtklock-powerbar-module
      gtklock-userinfo-module
    ];
  };

  environment.systemPackages = with pkgs; [
    adw-gtk3
  ];
}
