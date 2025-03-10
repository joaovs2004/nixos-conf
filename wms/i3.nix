{config, lib, pkgs, ...}:

let
  mod = "Mod4";
in {
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
            command = "exec --no-startup-id xrandr --output HDMI-1 --mode 1920x1080 --rate 144 --scale 1x1";
          }
          {
            command = "exec --no-startup-id feh --bg-fill ~/Imagens/wallpaper.png";
          }
      ];
      keybindings = lib.mkOptionDefault {
        "${mod}+t" = "exec ${pkgs.kitty}/bin/kitty";
        "${mod}+b" = "exec ${pkgs.brave}/bin/brave";
        "${mod}" = "exec ${pkgs.rofi}/bin/rofi -show drun";

        "${mod}+q" = "kill";
        "${mod}+Shift+r" = "exec restart";

        # Focus
        "${mod}+Left" = "focus left";
        "${mod}+Down" = "focus down";
        "${mod}+Up" = "focus up";
        "${mod}+Right" = "focus right";

        # Move
        "${mod}+Shift+Left" = "move left";
        "${mod}+Shift+Down" = "move down";
        "${mod}+Shift+Up" = "move up";
        "${mod}+Shift+Right" = "move right";
      };
    };
  };
}
