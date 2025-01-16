{config, pkgs, ...}:

{
  programs.neovim = {
    enable = true;
    extraPackages = with pkgs; [
      wl-clipboard
      unzip
      python3
      nodejs
      gcc
      gnumake
    ];
  };
}
