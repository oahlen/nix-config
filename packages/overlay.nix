final: prev: {
  homage = final.callPackage ./homage { };
  huevim = final.callPackage ./huevim { };
  nixvim = final.callPackage ./nixvim { full = true; };
  rbw = final.callPackage ./rbw { inherit (prev) rbw; };
  rebuild = final.callPackage ./rebuild { };
  stylua-wrapped = final.callPackage ./stylua { };
}
