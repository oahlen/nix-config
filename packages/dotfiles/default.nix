{
  writeShellApplication,
}:
writeShellApplication {
  name = "dotfiles";
  runtimeInputs = [ ];
  text = builtins.readFile ./dotfiles;
}
