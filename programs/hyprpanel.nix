{config, pkgs, hostName, ...}:

let 
  layoutPc = [
    "media"
    "volume"
    "kbinput"
    "network"
    "systray"
    "clock"
    "notifications"
  ];
  layoutNotebook = [
    "media"
    "volume"
    "bluetooth"
    "battery"
    "network"
    "systray"
    "clock"
    "notifications"
  ];
in
{
  programs.hyprpanel = {
    enable = true;

    settings = {
      layout = {
        "bar.layouts" = {
          "0" = {
            left = [ "dashboard" "workspaces" ];
            middle = [ ];
            right = if hostName == "nixos-pc" then layoutPc else layoutNotebook;
            };
        };
      };

      bar.clock.format = "%a %b %d  %H:%M";
      bar.launcher.icon = "";
      bar.workspaces.show_numbered = true;
      bar.network.label = false;
      bar.media.show_active_only = true;

      menus.clock = {
        time = {
          military = true;
          hideSeconds = true;
        };
        weather.unit = "metric";
      };

      theme.name = "monochrome";
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
