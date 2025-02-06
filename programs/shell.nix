{config, pkgs, ...}:

{
  programs.zsh = {
    enable = true;
    plugins = [
      {
        name = "zsh-autosuggestions";
	      src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-autosuggestions";
          rev = "v0.4.0";
          sha256 = "0z6i9wjjklb4lvr7zjhbphibsyx51psv50gm07mbb0kj9058j6kc";
        };
      }
    ];
    completionInit = "autoload -Uz compinit && compinit\nzstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'";
  };
  
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      add_newline = false;
      cmd_duration = { disabled = true; };
      aws = { symbol = "  "; };
      buf = { symbol = " "; };
      c = { symbol = " "; };
      cmake = { symbol = " "; };
      conda = { symbol = " "; };
      crystal = { symbol = " "; };
      dart = { symbol = " "; };
      directory = { read_only = "󰌾"; };
      docker_context = { symbol = " "; };
      elixir = { symbol = " "; };
      elm = { symbol = " "; };
      fennel = { symbol = " "; };
      fossil_branch = { symbol = " "; };
      git_branch = { symbol = " "; };
      git_commit = { tag_symbol = " "; };
      golang = { symbol = " "; };
      guix_shell = { symbol = " "; };
      haskell = { symbol = " "; };
      haxe = { symbol = " "; };
      hg_branch = { symbol = " "; };
      hostname = { ssh_symbol = " "; };
      java = { symbol = " "; };
      julia = { symbol = " "; };
      kotlin = { symbol = " "; };
      lua = { symbol = " "; };
      memory_usage = { symbol = "󰍛 "; };
      meson = { symbol = "󰔷 "; };
      nim = { symbol = "󰆥 "; };
      nix_shell = { symbol = " "; };
      nodejs = { symbol = " "; };
      ocaml = { symbol = " "; };
      os.symbols = {
        NixOS = " ";
      };
      package = { symbol = "󰏗 "; };
      perl = { symbol = " "; };
      php = { symbol = " "; };
      pijul_channel = { symbol = " "; };
      python = { symbol = " "; };
      rlang = { symbol = "󰟔 "; };
      ruby = { symbol = " "; };
      rust = { symbol = "󱘗 "; };
      scala = { symbol = " "; };
      swift = { symbol = " "; };
      zig = { symbol = " "; };
      gradle = { symbol = " "; };
    };
  };
}
