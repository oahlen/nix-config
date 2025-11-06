{
  nixos-rebuild-ng,
  writeShellApplication,
}:
writeShellApplication {
  name = "rebuild";
  runtimeInputs = [ nixos-rebuild-ng ];
  text = ''
    if [[ $# -eq 0 ]]; then
        nh os --help
        exit 0
    fi

    HOSTNAME="$(hostname)"
    echo -e "Running nixos-rebuild \e[1;33m$1\e[0m for host \e[1;36m$HOSTNAME\e[0m ..."
    nh os "$1" --file . "hosts.$HOSTNAME" --no-nom
  '';
}
