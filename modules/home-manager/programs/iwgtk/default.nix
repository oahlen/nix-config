{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [iwgtk];

  xdg.configFile."iwgtk.conf".text = ''
    [indicator.colors.station]
    connected=${config.colors.statusline.foreground}
    connecting=${config.colors.yellow}
    disconnected=${config.colors.bright-black}

    [indicator.colors.ap]
    up=${config.colors.statusline.foreground}
    down=${config.colors.bright-black}

    [indicator.colors.adhoc]
    up=${config.colors.statusline.foreground}
    down=${config.colors.bright-black}

    [indicator.colors.disabled]
    device=${config.colors.statusline.foreground}
    adapter=${config.colors.statusline.foreground}
  '';
}
