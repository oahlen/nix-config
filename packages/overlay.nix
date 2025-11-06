final: prev: {
  homage = final.callPackage ./homage { };
  huevim = final.callPackage ./huevim { };
  nixvim = final.callPackage ./nixvim { };
  rbw-wrapped = final.callPackage ./rbw-wrapped { };
  rebuild = final.callPackage ./rebuild { };
}
