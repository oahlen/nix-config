set positional-arguments

# Shows available commands
help:
    @just --list

# Runs nixos-rebuild for the current host
@rebuild operation:
    HOSTNAME="$(hostname)"
    echo -e "Running nixos-rebuild \e[1;33m$1\e[0m for host \e[1;36m$HOSTNAME\e[0m ..."
    nixos-rebuild "$1" --file "$DOTFILES" -A "hosts.$HOSTNAME" --quiet --no-reexec --sudo

# Build and switch to the generic user environment
@env-switch:
    nix run -f "$DOTFILES" "homes.generic.switch"

# Runs the specified package
@run package:
    echo -e "Running package \e[1;33m$1\e[0m"
    nix run -f "$DOTFILES" "packages.$1"

# Enters the specified shell
@shell name:
    echo -e "Running shell \e[1;33m$1\e[0m"
    nix-shell "$DOTFILES" -A "shells.$1" --command "$SHELL"
