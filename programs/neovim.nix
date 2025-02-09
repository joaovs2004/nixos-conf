{config, pkgs, ...}:

{
  programs.nixvim = {
    enable = true;

    extraPackages = with pkgs; [
      wl-clipboard
      ripgrep
      lua
      unzip
      python3
      nodejs
      gcc
      gnumake
    ];
  };
}
