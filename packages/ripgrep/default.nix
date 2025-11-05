{
  lib,
  makeWrapper,
  ripgrep,
  symlinkJoin,
}:
let
  args = [
    "--hidden"
    "--glob"
    "!.cache/"
    "--glob"
    "!.git/"
  ];
in
symlinkJoin {
  name = "rg";
  paths = [ ripgrep ];
  nativeBuildInputs = [ makeWrapper ];
  postBuild = ''
    wrapProgram $out/bin/rg \
      ${lib.concatMapStrings (x: "--add-flags '${x}' \\\n") args}
  '';
}
