{
  customPackages,
  pkgs,
  ...
}: {
  # Language servers and tools
  home.packages = with pkgs; [
    customPackages.nixvim-full
    alejandra
    stylua
    typos
  ];
}
