if [ -n "$PS1" ]; then
    if true || [ -z "$IN_NIX_SHELL$NIX_GCROOT$(printenv PATH | grep '/nix/store')" ] ; then
  eval "$(direnv hook bash)"
fi
