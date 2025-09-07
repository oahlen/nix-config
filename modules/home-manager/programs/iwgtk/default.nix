{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [iwgtk];

  xdg.configFile."iwgtk.conf".text = ''
    [indicator.colors.station]
    connected=${config.colorscheme.statusline.foreground}
    connecting=${config.colorscheme.yellow}
    disconnected=${config.colorscheme.bright-black}

    [indicator.colors.ap]
    up=${config.colorscheme.statusline.foreground}
    down=${config.colorscheme.bright-black}

    [indicator.colors.adhoc]
    up=${config.colorscheme.statusline.foreground}
    down=${config.colorscheme.bright-black}

    [indicator.colors.disabled]
    device=${config.colorscheme.statusline.foreground}
    adapter=${config.colorscheme.statusline.foreground}

    [window]
    dark=true
  '';
}
