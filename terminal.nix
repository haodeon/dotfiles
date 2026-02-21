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
          version = "unstable-2026-02-09";
          src = pkgs.fetchFromGitHub {
            owner = "wfxr";
            repo = "tmux-power";
            rev = "7a64f96f90912b0b8e290e2ce26a243bc6239211";
            sha256 = "sha256-RTt2MXrbXwzHST9pdOwz8fADJmmBPE7upOFD8Ox7u1o=";
          };
        });
        extraConfig = ''
          set -g @tmux_power_theme 'coral'
        '';
      }
    ];
    extraConfig = ''
      set -as terminal-features ",xterm-256color:RGB"
      set -s command-alias[6] "nu=new-window nu"
      set-hook -g after-new-session 'nu'
    '';
  };

  programs.bat.enable = true;

  programs.broot = {
    enable = true;
    enableNushellIntegration = true;
  };
}
