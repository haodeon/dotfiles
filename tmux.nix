{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    escapeTime = 100;
    keyMode = "vi";
    mouse = true;
    terminal = "tmux-256color";
    plugins = with pkgs; [
      {
        plugin = tmuxPlugins.power-theme.overrideAttrs ( _: {
          version = "unstable-2023-11-08";
          src = pkgs.fetchFromGitHub {
            owner = "wfxr";
            repo = "tmux-power";
            rev = "1d73c304573b3ae369567d2ef635f0e1c3de7ecc";
            sha256 = "sha256-HOUnLm2GSvJkCxK9ofM5p2I9xpF6Se44/8a/bkwrnmw=";
          };
        });
        extraConfig = ''
          set -g @tmux_power_theme 'everforest'
        '';
      }
    ];
    extraConfig = ''
      set -as terminal-features ",xterm-256color:RGB"
    '';
  };

  programs.bat.enable = true;
}
