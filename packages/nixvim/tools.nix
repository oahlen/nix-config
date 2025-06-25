{pkgs}:
with pkgs;
# Language servers
  [
    nixd
    nodePackages.svelte-language-server
    nodePackages.typescript-language-server
    nodePackages.vscode-langservers-extracted
    pyright
    shellcheck
    sumneko-lua-language-server
  ]
  # Linters
  ++ [
    alejandra
    jq
    stylua
  ]
