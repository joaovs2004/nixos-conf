{config, lib, pkgs, ...}:

{
  services.picom = {
    enable = false;
    vSync = true;
    backend = "glx";
    settings = {
      refresh-rate = 144;
    };
  };
}
