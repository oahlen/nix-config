{pkgs, ...}: {
  programs.singularity = {
    enable = true;
    package = pkgs.apptainer;
  };

  environment.systemPackages = with pkgs; [
    gocryptfs
  ];
}
