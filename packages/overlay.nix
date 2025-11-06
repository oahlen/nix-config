final: prev: {
  fd = final.callPackage ./fd { inherit (prev) fd; };
  homage = final.callPackage ./homage { };
  huevim = final.callPackage ./huevim { };
  nixvim = final.callPackage ./nixvim { full = true; };
  rbw = final.callPackage ./rbw { inherit (prev) rbw; };
  rebuild = final.callPackage ./rebuild { };
  ripgrep = final.callPackage ./ripgrep { inherit (prev) ripgrep; };
  stylua-wrapped = final.callPackage ./stylua { };
}
