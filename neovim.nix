{ inputs, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    withPython3 = true;
    withRuby = false;
  };

  xdg.configFile."nvim".source = inputs.astronvim;
  xdg.configFile."astronvim/lua/user/init.lua".source = ./neovim/init.lua;

  programs.fzf.enable = true;
  programs.ripgrep.enable = true;

  home.packages = with pkgs; [
    gdu
    tree-sitter
  ];
}
