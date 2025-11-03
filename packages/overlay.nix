final: prev: {
  homage = final.callPackage ./homage { };
  huevim = final.callPackage ./huevim { };
  nixvim = final.callPackage ./nixvim { full = true; };
  rbw-wrapped = final.callPackage ./rbw { };
  stylua-wrapped = final.callPackage ./stylua { };
}
