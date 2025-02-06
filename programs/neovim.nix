{config, pkgs, ...}:

{
  programs.neovim = {
    enable = true;
    extraPackages = with pkgs; [
      wl-clipboard
      lua
      unzip
      python3
      nodejs
      gcc
      gnumake
    ];
  };
}
