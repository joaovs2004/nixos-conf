{config, pkgs, ...}:

{
  programs.kitty = {
    enable = true;
    font.name = "Fira Code";
    font.size = 12;
    shellIntegration.mode = "no-cursor";
    themeFile = "kanagawa_dragon";

    settings = {
      cursor_shape = "block";
      enable_audio_bell = false;
      window_padding_width = 1.0;
    };
  };
}
