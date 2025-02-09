{config, pkgs, ...}:

{
  programs.hyprpanel = {
    enable = true;
    theme = "monochrome";

    layout = {
      "bar.layouts" = {
        "0" = {
          left = [ "dashboard" "workspaces" ];
          middle = [ "media" ];
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
      bar.media.show_active_only = true;

      menus.clock = {
        time = {
          military = true;
          hideSeconds = true;
        };
        weather.unit = "metric";
      };

      menus.media.hideAuthor = false;
      menus.media.noMediaText = "";

      theme.bar.floating = true;
      theme.bar.scaling = 95;
      theme.bar.outer_spacing = "0.1em";
      theme.bar.buttons.y_margins = "0.1em";
      theme.bar.margin_top = "0.1em";
      theme.bar.margin_sides = "0.1em";

      theme.font = {
        size = "1rem";
        weight = 600;
      };

      wallpaper.enable = true;
      wallpaper.image = "/home/jvs/Imagens/wallpaper.jpg";
    };
  };
}
