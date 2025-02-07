{ config, pkgs, inputs, ... }:

{
  home.username = "jvs";
  home.homeDirectory = "/home/jvs";

  home.stateVersion = "24.11";
  programs.home-manager.enable = true;

  imports = [
    ./programs/shell.nix
    ./programs/wofi.nix
    ./programs/neovim.nix
    ./programs/kitty.nix
    ./hyprland/conf.nix
  ];

  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    hyprpanel
    fira-code
    fira-code-nerdfont
    noto-fonts
    noto-fonts-emoji
    corefonts
    vistafonts
    tela-icon-theme
    gnome-text-editor
    insomnia
    obsidian
    hyprshot
    gnome-calculator
    libsForQt5.qt5ct
    libsForQt5.qtstyleplugin-kvantum
    git
  ];

  programs.vscode.enable = true;

  programs.chromium = {
    enable = true;
    package = pkgs.brave;
  };

  home.pointerCursor = {
    package = pkgs.simp1e-cursors;
    name = "Simp1e-Dark";
    size = 24;
  };

  gtk = {
    enable = true;
    font = {
      package = pkgs.cantarell-fonts;
      name = "Cantarell";
    };
    cursorTheme = {
      package = pkgs.simp1e-cursors;
      name = "Simp1e-Dark";
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
    "/home/jvs/.config/nvim" = {
      source = ./programs/nvim;
      recursive = true;
    };
    "/home/jvs/.config/Kvantum" = {
      source = ./programs/Kvantum;
      recursive = true;
    };
    "/home/jvs/.config/Insomnia/plugins/imsonmnia-plugin-mountain" = {
      source = ./programs/imsonmnia-plugin-mountain;
      recursive = true;
    };
    "/home/jvs/.config/hyprpanel" = {
      source = ./programs/hyprpanel;
      recursive = true;
    };
  };
}
