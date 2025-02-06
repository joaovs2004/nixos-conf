{config, pkgs, ...}:

{
  programs.kitty = {
    enable = true;
    font.name = "Fira Code";
    font.size = 12;

    settings = {
      enable_audio_bell = false;
      # Cursor settings
      # cursor = "#f0f0f0";
      # cursor_text_color = "#ffffff";
      window_padding_width = 1.0;

      background = "#0f0f0f";
      foreground = "#f0f0f0";
      selection_foreground = "#262626";
      selection_background= "#f0f0f0";
      url_color = "#c6a679";

      color0 = "#4c4c4c";  # black
      color1 = "#ac8a8c";  # red
      color2 = "#8aac8b";  # green
      color3 = "#aca98a";  # yellow
      color4 = "#8f8aac";  # blue
      color5 = "#ac8aac";  # magenta
      color6 = "#8aacab";  # cyan
      color7 = "#f0f0f0";  # white
      color8 = "#4c4c4c";
      color9 = "#c49ea0";  # red (bright)
      color10 = "#9ec49f"; # green (bright)
      color11 = "#c4c19e"; # yellow (bright)
      color12 = "#a39ec4"; # blue (bright)
      color13 = "#c49ec4"; # magenta (bright)
      color14 = "#9ec3c4"; # cyan (bright)
      color15 = "#e7e7e7"; # white (bright)
    };
  };
}
