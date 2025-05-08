{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ../hardware/hardware-configuration-pc.nix
      ../configuration-base.nix
    ];

  networking.hostName = "nixos-pc"; # Define your hostname.

  # Edid modified to use correct pixel format in AMD, see more on https://www.wezm.net/v2/posts/2020/linux-amdgpu-pixel-format/
  boot.kernelParams = [ "drm.edid_firmware=HDMI-A-1:edid/edid.bin" "video=HDMI-A-1" ];
  hardware.firmware = [
    (
       pkgs.runCommand "edid.bin" { } ''
       mkdir -p $out/lib/firmware/edid
       cp ${../wms/edid.bin} $out/lib/firmware/edid/edid.bin
       ''
    )];

  services.xserver.enableTearFree = true;
  services.xserver.videoDrivers = ["amdgpu" "modesetting"];
  services.xserver.xkb = {
      layout = "us,us";
      variant = ",intl";
      options = "grp:win_space_toggle";
  };

  console.keyMap = "us-acentos";
}
