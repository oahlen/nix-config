{
  pkgs,
  user,
  ...
}:
{
  # Since we don't have a hardware-configuration.nix
  nixpkgs.hostPlatform = "x86_64-linux";

  wsl = {
    enable = true;
    defaultUser = "${user.name}";
    useWindowsDriver = true;
  };

  modules = {
    development.enable = true;

    virtualisation = {
      apptainer.enable = true;
      podman.enable = true;
    };
  };

  services.timesyncd.enable = true;

  programs = {
    dconf.enable = true;
    git.lfs.enable = true;
    ssh.startAgent = true;
  };

  dotfiles.files = [
    ".config/fd/ignore"

    ".config/bat/config"
    ".config/bat/themes/base16.tmTheme"

    ".config/bottom/bottom.toml"

    ".config/fish/conf.d/theme.fish"
    ".config/fish/functions/colors.fish"
    ".config/fish/functions/dev-session.fish"
    ".config/fish/functions/doscleanup.fish"
    ".config/fish/functions/fetch.fish"
    ".config/fish/functions/fish_mode_prompt.fish"
    ".config/fish/functions/fish_prompt.fish"
    ".config/fish/functions/rebuild.fish"
    ".config/fish/functions/shell.fish"
    ".config/fish/functions/skim.fish"
    ".config/fish/functions/vio.fish"
    ".config/fish/config.fish"

    ".config/foot/foot.ini"

    ".config/fuzzel/fuzzel.ini"

    ".config/git/config"

    ".config/gitui/key_bindings.ron"
    ".config/gitui/theme.ron"

    ".config/gtk-3.0/settings.ini"

    ".config/gtk-4.0/settings.ini"

    ".config/ideavim/.ideavimrc"

    ".config/kitty/kitty.conf"

    ".config/mako/config"

    ".config/MangoHud/MangoHud.conf"

    ".config/niri/config.kdl"

    ".config/ripgrep/ripgreprc"

    ".config/scripts/kernels"
    ".config/scripts/markdown-viewer"
    ".config/scripts/nix-kernels"
    ".config/scripts/op-password-picker"
    ".config/scripts/password-picker"
    ".config/scripts/theme-switcher"
    ".config/scripts/toPdf"
    ".config/scripts/wl-logout"

    ".config/sway/config"

    ".config/swaynag/config"

    ".config/tmux/tmux.conf"

    ".config/tmuxp/dev-session.yaml"
    ".config/tmuxp/dotfiles.yaml"
    ".config/tmuxp/nix-config.yaml"
    ".config/tmuxp/notes.yaml"

    ".config/waybar/config"
    ".config/waybar/power_menu.xml"
    ".config/waybar/style.css"

    ".config/yazi/theme.toml"
    ".config/yazi/yazi.toml"

    ".config/mimeapps.list"
    ".config/user-dirs.conf"
    ".config/user-dirs.dirs"

    ".icons/default/index.theme"

    ".ssh/config"

    ".bash_profile"
    ".bashrc"
    ".profile"
    ".Xresources"
  ];

  environment.systemPackages = with pkgs; [
    # awscli2 # Currently broken
    _1password-cli
    duckdb
    hyperfine
    nodejs # For Github Copilot
    pqrs
    qsv
    typst
    wl-clipboard
    xdg-utils
  ];

  system.stateVersion = "24.11";
}
