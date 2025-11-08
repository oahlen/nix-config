{ pkgs }:
let
  entries = builtins.readDir ./.;
  dirs = builtins.filter (name: entries.${name} == "directory") (builtins.attrNames entries);
  mkAttr = name: {
    inherit name;
    value = import ./${name} { inherit pkgs; };
  };
in
builtins.listToAttrs (map mkAttr dirs)
