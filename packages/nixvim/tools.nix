{ pkgs }:
with pkgs;
# Language servers
[
  lua-language-server
  nixd
  nodePackages.svelte-language-server
  nodePackages.typescript-language-server
  nodePackages.vscode-langservers-extracted
  pyright
  shellcheck
]
# Linters
++ [
  jq
  nixfmt
  # To prevent infinite recursion
  (pkgs.callPackage ./../stylua { })
]
