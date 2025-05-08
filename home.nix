{ config, pkgs, inputs,  ... }:

{
  home.username = "jvs";
  home.homeDirectory = "/home/jvs";

  home.stateVersion = "24.11";
  programs.home-manager.enable = true;

  imports = [
    ./programs/shell.nix
    ./programs/wofi.nix
    ./programs/kitty.nix
    ./programs/neovim.nix
    ./programs/hyprpanel.nix
    ./wms/hyprland.nix
    ./wms/i3.nix
  ];

  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    wl-clipboard
    xdg-utils
    tela-icon-theme
    gnome-text-editor
    insomnia
    obsidian
    hyprshot
    gnome-calculator
    libsForQt5.qt5ct
    libsForQt5.ark
    libsForQt5.qtstyleplugin-kvantum
    lazygit
    git
    fd
    satty
    wl-clip-persist
    btop
    vlc
    loupe
    zed-editor
  ];

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
    options = [
      "--cmd cd"
    ];
  };

  programs.vscode.enable = true;

  programs.chromium = {
    enable = true;
    package = pkgs.brave;
  };

  home.pointerCursor = {
    package = pkgs.quintom-cursor-theme;
    name = "Quintom_Ink";
    size = 24;
  };

  gtk = {
    enable = true;
    font = {
      package = pkgs.cantarell-fonts;
      name = "Cantarell";
    };
    cursorTheme = {
      package = pkgs.quintom-cursor-theme;
      name = "Quintom_Ink";
    };
    theme = {
      package = (pkgs.orchis-theme.override  { tweaks = ["black"]; });
      name = "Orchis-Dark";
    };
    iconTheme = {
      package = pkgs.tela-icon-theme;
      name = "Tela-blue-dark";
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "qtct";
    style.name = "kvantum";
  };

  home.file = {
    "/home/jvs/.config/Kvantum" = {
      source = ./programs/Kvantum;
      recursive = true;
    };
    "/home/jvs/.local/share/fonts" = {
      source = ./fonts;
      recursive = true;
    };
  };
}
