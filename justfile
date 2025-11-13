set positional-arguments

# Show available commands
help:
    @just --list --unsorted

# Open the pinned nixpkgs release page
@sources:
    url=$(jq -r '.pins.nixpkgs.url' npins/sources.json); xdg-open "${url%/*}"

# Run nixos-rebuild boot for the current host
@boot:
    nixos-rebuild boot -f . -A "hosts.$(hostname)" --quiet --no-reexec --sudo

# Run nixos-rebuild switch for the current host
@switch:
    nixos-rebuild switch -f . -A "hosts.$(hostname)" --quiet --no-reexec --sudo

# Build and switch to the generic user environment
@env-switch:
    nix run -f . "homes.generic.switch"

# Run the specified package
@run package:
    nix run -f . "packages.$1"

# Enter the specified shell
@shell name:
    nix-shell . -A "shells.$1" --command "$SHELL"

# Format nix code
@fmt:
    treefmt

# Lint nix code
@lint:
    statix check

# Format lua code
@lua:
    stylua packages/nixvim
