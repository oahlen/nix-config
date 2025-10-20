{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.dotfiles;
in
{
  options.dotfiles = {
    source = mkOption {
      type = lib.types.str;
      default = "$FLAKE/dotfiles";
      description = "The source directory of the dotfiles";
    };

    target = mkOption {
      type = lib.types.str;
      default = "$HOME";
      description = "The target directory of the dotfiles";
    };

    files = mkOption {
      type = with types; listOf str;
      description = "List of relative dotfile paths to symlink.";
      example = [
        ".bashrc"
        ".config/git/config"
      ];
    };
  };

  config = mkIf (builtins.length cfg.files > 0) {
    environment.systemPackages =
      let
        installScript = pkgs.writeShellApplication {
          name = "dotfiles-manager";
          text = ''
            usage() {
              echo "Usage: $0 [install|uninstall]"
              exit 1
            }

            symlink_dotfile() {
              local file="$1"
              local source="${cfg.source}/$file"
              local target="${cfg.target}/$file"

              if [ ! -e "$source" ]; then
                echo "Error: Source file $source does not exist." >&2
                return 1
              fi

              echo "Installing $source to $target"
              mkdir -p "$(dirname "$target")"
              ln -sf "$source" "$target"
            }

            remove_dotfile() {
              local file="$1"
              local target="${cfg.target}/$file"
              echo "Removing $target"
              rm -f "$target"
            }

            [ $# -eq 1 ] || usage

            action="$1"

            case "$action" in
              install)
            ${builtins.concatStringsSep "\n" (map (file: "    symlink_dotfile \"${file}\"") cfg.files)}
              ;;

              uninstall)
            ${builtins.concatStringsSep "\n" (map (file: "    remove_dotfile \"${file}\"") cfg.files)}
              ;;

              *)
                usage
              ;;
            esac
          '';
        };
      in
      [ installScript ];
  };
}
