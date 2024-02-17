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
          version = "unstable-2024-02-20";
          src = pkgs.fetchFromGitHub {
            owner = "wfxr";
            repo = "tmux-power";
            rev = "2e362c50e5772ba1d13a00628baba558b4220f41";
            sha256 = "sha256-1hjQXC7261DiwrZ54PiwMLJM62srmP8koPNnTEp2zdI=";
          };
        });
        extraConfig = ''
          set -g @tmux_power_theme 'coral'
        '';
      }
    ];
    extraConfig = ''
      set -as terminal-features ",xterm-256color:RGB"
    '';
  };

  programs.bat.enable = true;
}
