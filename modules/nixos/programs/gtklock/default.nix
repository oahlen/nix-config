{pkgs, ...}: {
  programs.gtklock = {
    enable = true;

    modules = with pkgs; [
      gtklock-powerbar-module
      gtklock-userinfo-module
    ];

    config = {
      main = {
        idle-hide = true;
        idle-timeout = 10;
      };
    };
  };
}
