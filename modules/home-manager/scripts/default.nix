{pkgs, ...}: {
  imports = [
    ./markdown-viewer
    ./op-password-picker
    ./password-picker
    ./theme-switcher
    ./toPdf
    ./wl-logout
  ];

  home.packages = with pkgs; [
    (writeShellApplication {
      name = "kernels";
      runtimeInputs = [curl jq];
      text = builtins.readFile ./kernels;
    })
    (writeShellApplication {
      name = "nix-kernels";
      runtimeInputs = [curl jq];
      text = builtins.readFile ./nix-kernels;
    })
  ];
}
