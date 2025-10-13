{
  makeWrapper,
  pkgs,
  symlinkJoin,
  ...
}:
# Create an rbw wrapper with pinentry-gnome3 accessible
symlinkJoin {
  name = "rbw";
  paths = with pkgs; [pinentry-gnome3 rbw];
  buildInputs = [makeWrapper];
  postBuild = ''
    wrapProgram $out/bin/rbw
  '';
}
