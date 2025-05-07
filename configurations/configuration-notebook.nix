{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ../hardware/hardware-configuration-notebook.nix
      ../configuration-base.nix
    ];

  services.xserver.xkb = {
      layout = "br";
      variant = "abnt2";
      model = "abnt2";
  };

  console.keyMap = "br-abnt2";
}
