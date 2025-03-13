{config, lib, pkgs, ...}:

let
  mod = "Mod4";
in {
  imports = [
    ./picom.nix
  ];

  xsession.windowManager.i3 = {
    enable = true;

    config = {
      modifier = "Mod4";
      gaps = {
        inner = 6;
        outer = 4;
      };
      floating.titlebar = false;
      window.titlebar = false;
      startup = [
          {
            command = "exec xrandr --output HDMI-A-0 --mode 1920x1080 --rate 144 --set TearFree off";
            notification = false;
          }
          {
            command = "exec xinput set-prop 9 'libinput Accel Profile Enabled' 0 1 0";
            notification = false;
          }
          {
            command = "exec autotiling";
            notification = false;
          }
          {
            command = "exec feh --bg-fill ~/Imagens/wallpaper.png";
            notification = false;
          }
          {
            command = "exec xset -dpms";
            notification = false;
          }
          {
            command = "exec xset s off";
            notification = false;
          }
      ];
      keybindings = lib.mkOptionDefault {
        "${mod}+t" = "exec ${pkgs.kitty}/bin/kitty";
        "${mod}+b" = "exec ${pkgs.brave}/bin/brave";
        "${mod}+Shift+b" = "exec ${pkgs.brave}/bin/brave --incognito";
        "${mod}+e" = "exec thunar";
        "Super_L --release" = "exec ${pkgs.rofi}/bin/rofi -show drun";

        "${mod}+q" = "kill";
        "${mod}+Shift+r" = "exec restart";

        # Focus
        "${mod}+Left" = "focus left";
        "${mod}+Down" = "focus down";
        "${mod}+Up" = "focus up";
        "${mod}+Right" = "focus right";

        # Move
        "${mod}+Shift+ctrl+Left" = "move left";
        "${mod}+Shift+ctrl+Down" = "move down";
        "${mod}+Shift+ctrl+Up" = "move up";
        "${mod}+Shift+ctrl+Right" = "move right";
      };
    };
  };
}
