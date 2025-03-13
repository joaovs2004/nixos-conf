{config, lib, pkgs, ...}:

let
  mod = "Mod4";
in {
  programs.i3status-rust = {
    enable = true;
    bars = {
      top = {
        blocks = [
          {
            block = "sound";
            click = [
              { 
                button = "left";
                cmd = "pavucontrol";
              }
            ];
          }
          {
            block = "keyboard_layout";
            driver = "localebus";
            format = " $layout ($variant)";
          }
          {
            block = "time";
            format = " $timestamp.datetime(f:'%a %d/%m %R') ";
            interval = 5;
          }
        ];
      };
    };
  };
  xsession.windowManager.i3 = {
    enable = true;

    config = {
      modifier = "Mod4";
      gaps = {
        inner = 5;
        outer = 3;
      };
      defaultWorkspace = "workspace number 1";
      floating.titlebar = false;
      window.titlebar = false;
      colors.focused = {
        background = "#393939";
        border = "#393939";
        childBorder = "#393939";
        indicator = "#393939";
        text = "#ffffff";
      };
      colors.focusedInactive = {
        background = "#191919";
        border = "#191919";
        childBorder = "#191919";
        indicator = "#191919";
        text = "#888888"; 
      };
      colors.unfocused = {
        background = "#191919";
        border = "#191919";
        childBorder = "#191919";
        indicator = "#191919";
        text = "#888888"; 
      };
      bars = [
        {
          position = "top";
          statusCommand = "${pkgs.i3status-rust}/bin/i3status-rs ~/.config/i3status-rust/config-top.toml";
        }
      ];
      startup = [
          {
            command = "exec xrandr --output HDMI-A-0 --mode 1920x1080 --rate 144";
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

        "${mod}+w" = "floating toggle";
        "${mod}+g" = "layout tabbed";

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

        # Resize
        "${mod}+Shift+Left" = "resize grow width 10 px or 10 ppt";
        "${mod}+Shift+Down" = "resize shrink height 10 px or 10 ppt";
        "${mod}+Shift+Up" = "resize grow height 10 px or 10 ppt";
        "${mod}+Shift+Right" = "resize shrink width 10 px or 10 ppt";
      };
    };
  };
}
