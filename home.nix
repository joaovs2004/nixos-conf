{ config, pkgs, inputs, ... }:

{
  home.username = "jvs";
  home.homeDirectory = "/home/jvs";

  home.stateVersion = "24.05";
  programs.home-manager.enable = true;

  imports = [
    ./programs/shell.nix
    ./programs/wofi.nix
    ./programs/neovim.nix
    ./hyprland/conf.nix
  ];

  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    hyprpanel
    fira-code
    nerd-fonts.fira-code
    nordic
    tela-icon-theme
    gnome-text-editor
    insomnia
    obsidian
    hyprshot
  ];

  programs.git.enable = true;

  programs.kitty = {
    enable = true;
    font.name = "Fira Code";
    font.size = 12;
    theme = "Nord";

    settings = {
      enable_audio_bell = false;
      window_padding_width = 7;
    };
  };

  programs.vscode.enable = true;

  programs.chromium = {
    enable = true;
    package = pkgs.brave;
  };

  home.pointerCursor = {
    package = pkgs.simp1e-cursors;
    name = "Simp1e-Nord-Dark";
    size = 24;
  };

  gtk = {
    enable = true;
    cursorTheme = {
      package = pkgs.simp1e-cursors;
      name = "Simp1e-Nord-Dark";
    };
    theme = {
      package = pkgs.nordic;
      name = "Nordic";
    };
    iconTheme = {
      package = pkgs.tela-icon-theme;
      name = "Tela-nord";
    };
  };
}
