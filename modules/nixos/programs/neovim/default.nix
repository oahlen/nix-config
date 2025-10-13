{
  customPackages,
  pkgs,
  ...
}: {
  # Language servers and tools
  environment.systemPackages = with pkgs; [
    customPackages.nixvim-full
    alejandra
    stylua
    typos
  ];
}
