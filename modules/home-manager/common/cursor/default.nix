{pkgs, ...}: {
  home.pointerCursor = {
    name = "Adwaita";
    package = pkgs.adwaita-icon-theme;
    gtk.enable = true;
    x11.enable = true;
    size = 24;
  };
}
