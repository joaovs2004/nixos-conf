{config, pkgs, ...}:

{
  programs.hyprpanel = {
    enable = true;
    theme = "monochrome";

    layout = {
      "bar.layouts" = {
        "0" = {
          left = [ "dashboard" "workspaces" ];
          middle = [ ];
          right = [
            "volume"
            "kbinput"
            "network"
            "systray"
            "clock"
            "notifications"
          ];
        };
      };
    };

    settings = {
      bar.clock.format = "%a %b %d  %H:%M";
      bar.launcher.icon = "";
      bar.workspaces.show_numbered = true;
      bar.network.label = false;

      menus.clock = {
        time = {
          military = true;
          hideSeconds = true;
        };
        weather.unit = "metric";
      };

      theme.bar.scaling = 95;
      theme.bar.outer_spacing = "0.1em";
      theme.bar.buttons.y_margins = "0.1em";
      theme.bar.margin_top = "0.1em";
      theme.bar.margin_sides = "0.1em";
      theme.bar.opacity = 45;
      theme.bar.buttons.background_opacity = 0;

      theme.font = {
        size = "1rem";
        weight = 600;
      };

      wallpaper.enable = true;
      wallpaper.image = "/home/jvs/Imagens/wallpaper.png";
    };
  };
}
