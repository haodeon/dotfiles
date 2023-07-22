{ ... }:

{
  programs.tmux = {
    enable = true;
    escapeTime = 100;
    keyMode = "vi";
    mouse = true;
    terminal = "tmux-256color";
    extraConfig = ''
      set -as terminal-features ",xterm-256color:RGB"
    '';
  };
}
