{config, pkgs, ...}:

{
  programs.nixvim = {
    enable = true;

    colorschemes.gruvbox = {
      enable = true;
      package = pkgs.vimPlugins.gruvbox-material-nvim;
    };
    plugins.lualine.enable = true;
  };
}
