{
  writeShellApplication,
}:
let
  source = "$FLAKE/dotfiles";
  target = "$HOME";
  files = [ ];
in
writeShellApplication {
  name = "dotfiles-manager";
  text = ''
    usage() {
      echo "Usage: $0 [install|uninstall]"
      exit 1
    }

    install_dotfile() {
      local file="$1"
      local source="${source}/$file"
      local target="${target}/$file"

      if [ ! -e "$source" ]; then
        echo "Error: Source file $source does not exist." >&2
        return 1
      fi

      echo "Installing $source to $target"
      mkdir -p "$(dirname "$target")"
      ln -sf "$source" "$target"
    }

    uninstall_dotfile() {
      local file="$1"
      local target="${target}/$file"
      echo "Removing $target"
      rm -f "$target"
    }

    [ $# -eq 1 ] || usage

    action="$1"

    files=(
    ${builtins.concatStringsSep "\n" (map (file: "  \"${file}\"") files)}
    )

    case "$action" in
      install)
        for file in "$''\{files[@]''\}"
        do
            install_dotfile "$file"
        done
      ;;

      uninstall)
        for file in "$''\{files[@]''\}"
        do
            uninstall_dotfile "$file"
        done
      ;;

      *)
        usage
      ;;
    esac
  '';
}
