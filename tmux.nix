{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    escapeTime = 100;
    keyMode = "vi";
    mouse = true;
    terminal = "tmux-256color";
    plugins = with pkgs; [
      tmuxPlugins.nord
    ];
    extraConfig = ''
      set -as terminal-features ",xterm-256color:RGB"
    '';
  };

  programs.bat.enable = true;
}
