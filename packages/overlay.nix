final: prev:
let
  entries = builtins.readDir ./.;
  dirs = builtins.filter (name: entries.${name} == "directory") (builtins.attrNames entries);
  mkAttr = name: {
    name = name;
    value = final.callPackage ./${name} { };
  };
in
builtins.listToAttrs (map mkAttr dirs)
