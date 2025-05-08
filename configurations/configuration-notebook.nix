{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ../hardware/hardware-configuration-notebook.nix
      ../configuration-base.nix
    ];

  networking.hostName = "nixos-notebook"; # Define your hostname.
  hardware.bluetooth.enable = true; # enables support for Bluetooth

  services.xserver.xkb = {
      layout = "br";
      variant = "abnt2";
      model = "abnt2";
  };

  services.upower.enable = true;

  console.keyMap = "br-abnt2";
}
