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
          /* background-image: url("${config.wallpaper}"); */
          /* ackground-size: cover; */
          /* ackground-repeat: no-repeat; */
          /* ackground-position: center; */
          background-color: ${config.colorscheme.background};
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
