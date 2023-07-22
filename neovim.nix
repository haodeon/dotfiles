{ inputs, ... }:

{
  programs.neovim = {
    enable = true;
    withPython3 = true;
    withRuby = false;
  };
  xdg.configFile."nvim".source = inputs.astronvim;
  xdg.configFile."astronvim/lua/user/init.lua".source = ./astronvim/init.lua;
}
