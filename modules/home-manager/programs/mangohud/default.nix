{...}: {
  programs.mangohud = {
    enable = true;

    settings = {
      gpu_junction_temp = true;
      gpu_mem_temp = true;
      gpu_power = true;
      gpu_temp = true;
      vram = true;
    };
  };
}
