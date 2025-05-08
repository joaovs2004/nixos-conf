{ config, pkgs, hostName, ... }:

{
  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland.settings = {
    "monitor" = if hostName == "nixos-pc" then "HDMI-A-1,1920x1080@144,0x0,1" else "eDP-1,1920x1080@60,0x0,1";

    "env" = [
      "QT_QPA_PLATFORM,wayland"
      "QT_QPA_PLATFORMTHEME,qt5ct"
      "QT_STYLE_OVERRIDE=kvantum"
      "ELECTRON_OZONE_PLATFORM_HINT,wayland"
    ];

    exec-once = [
      "hyprpanel"
      "wl-clip-persist --clipboard regular"
    ];

    xwayland = {
      force_zero_scaling = true;
    };

    "layerrule" = "blur,bar-0";

    "$mod" = "SUPER";
    "$terminal" = "kitty";
    "$menu" = "wofi --show drun";
    "$term" = "kitty";
    "$editor" = "code --ozone-platform-hint=wayland --disable-gpu";
    "$file" = "thunar";
    "$browser" = "brave --ozone-platform-hint=auto";

    input = {
      kb_layout = if hostName == "nixos-pc" then "us,us" else "br";
      kb_variant = if hostName == "nixos-pc" then ",intl" else "abnt2";
      kb_options = "grp:win_space_toggle";
      follow_mouse = 1;
      sensitivity = -0.5;
      force_no_accel = 1;
      accel_profile = "flat";
      numlock_by_default = true;
    };

    general = {
      gaps_in = 2;
      gaps_out = 5;
      border_size = if hostName == "nixos-pc" then 1 else 3;
      "col.active_border" = "rgb(393939)";
      "col.inactive_border" = "rgb(191919)";
      layout = "dwindle";
      resize_on_border = true;
    };

    group = {
      "col.border_active" = if hostName == "nixos-pc" then "rgb(393939)" else "rgb(4c4c4c)";
      "col.border_inactive" = "rgb(191919)";

      groupbar = {
        "col.active" = "rgb(4c4c4c)";
        "col.inactive" = "rgb(262626)";
      };
    };

    decoration = {
      rounding = 2;

      blur = {
        enabled = "yes";
        size = 10;
        passes = 3;
        new_optimizations = "on";
        ignore_opacity = "on";
        xray = false;
      };
    };

    dwindle = {
      pseudotile = "yes";
      preserve_split = "yes";
    };

    master = {
      new_status = true;
    };

    binds = {
      allow_workspace_cycles = true;
    };

    misc = {
      vrr = 1;
      disable_hyprland_logo = true;
      disable_splash_rendering = true;
      force_default_wallpaper = 0;
      focus_on_activate = true;
    };

    animations = {
      enabled = "yes";
      bezier = [
        "wind, 0.05, 0.9, 0.1, 1.05"
        "winIn, 0.1, 1.0, 0.1, 1.0"
        "winOut, 0.3, -0.3, 0, 1"
        "liner, 1, 1, 1, 1"
      ];
      animation = [
        "windows, 1, 6, wind, slide"
        "windowsOut, 1, 5, winOut, slide"
        "windowsIn, 1, 6, winIn, slide"
        "windowsMove, 1, 5, wind, slide"
        "border, 1, 1, liner"
        "borderangle, 1, 30, liner, loop"
        "fade, 1, 10, default"
        "workspaces, 1, 5, wind"
      ];
    };

    bind = [
      "$mod, Q, killactive"
      "$mod, W, togglefloating"
      "$mod, G, togglegroup"
      "$mod, Tab, changegroupactive, f"
      "$mod SHIFT, Tab, changegroupactive, b"
      "ALT, return, fullscreen"
      "$mod SHIFT, S, exec, hyprshot -m region -s --raw | satty -f -  -o '/home/jvs/Imagens/screenshots/%F_%H-%M.png'"
      "$mod, B, exec, $browser"
      "$mod, T, exec, $term"
      "$mod, E, exec, $file"
      "$mod SHIFT, B, exec, $browser --incognito"
      "$mod, SUPER_L, exec, pidof wofi || wofi --show=drun --insensitivo --allow-images"
      "$mod, left, movefocus, l"
      "$mod, right, movefocus, r"
      "$mod, up, movefocus, u"
      "$mod, down, movefocus, d"
      "ALT, Tab, workspace, previous"
      "$mod SHIFT, right, resizeactive, 30 0"
      "$mod SHIFT, left, resizeactive, -30 0"
      "$mod SHIFT, up, resizeactive, 0 -30"
      "$mod SHIFT, down, resizeactive, 0 30"
      "$mod SHIFT $CONTROl, left, movewindow, l"
      "$mod SHIFT $CONTROL, right, movewindow, r"
      "$mod SHIFT $CONTROl, up, movewindow, u"
      "$mod SHIFT $CONTROL, down, movewindow, d"
      "$mod, J, togglesplit"
      "$mod, D, workspace, 10"
    ] ++ (
      builtins.concatLists (builtins.genList (i:
        let ws = i + 1;
        in [
        "$mod, code:1${toString i}, workspace, ${toString ws}"
        "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
        ]
        )
      9)
    );

    bindm = [
      "$mod, mouse:272, movewindow"
      "$mod, mouse:273, resizewindow"
    ];

    windowrulev2 = [
      "opacity 0.90 0.90,class:^(code)$"
      "opacity 0.90 0.90,class:^(thunar)$"
      "opacity 0.90 0.90,class:^(kitty)$"
      "opacity 0.90 0.90,class:^(discord)$"
      "opacity 0.90 0.90,class:^(Insomnia)$"
      "float,title:^(Picture-in-Picture)$"
      "float,class:^(kvantummanager)$"
      "float,class:^(qt5ct)$"
      "float,class:^(qt6ct)$"
      "float,class:^(pavucontrol)$"
      "float,class:^(org.gnome.Calculator)$"
      "float,class:^(xdg-desktop-portal-gtk)$"
      "float,title:^(Open Folder)$,class:^(code)$"
      "float,class:^(org.gnome.Loupe)$"
      "size 360 616,class:^(org.gnome.Calculator)$"
      "size 1367 754,class:^(xdg-desktop-portal-gtk)$"
      "size 1367 754,title:^(Open Folder)$,class:^(code)$"
      "size 1375 804,class:^(org.gnome.Loupe)$"
    ];
  };
}
