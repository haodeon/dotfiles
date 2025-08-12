{ inputs, config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    extraWrapperArgs = [
      "--prefix"
      "PATH"
      ":"
      "${pkgs.lib.makeBinPath [ pkgs.stdenv.cc pkgs.binutils pkgs.gnumake pkgs.python3 pkgs.unzip ]}"
    ];
    withPython3 = true;
    withRuby = false;
  };

  xdg.configFile."nvim" = {
    source = ./config;
    recursive = true;
  };
  xdg.configFile."nvim/lazy-lock.json" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.xdg.configHome}/home-manager/neovim/lazy-lock.json";
  };

  programs.fzf.enable = true;
  programs.ripgrep.enable = true;

  home.packages = with pkgs; [
    gdu
    tree-sitter
    lua-language-server
    regal
    rust-analyzer
    stylua
  ];
}
