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
          version = "unstable-2024-12-29";
          src = pkgs.fetchFromGitHub {
            owner = "wfxr";
            repo = "tmux-power";
            rev = "e68f9e6fb42cf372c2f17b51edc63abb4f6e9558";
            sha256 = "sha256-A+GYM+QegeivfwThfZ0vlAt/Lo4dOjnYomucEZNExlM=";
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
    '';
  };

  programs.bat.enable = true;

  programs.broot = {
    enable = true;
    enableNushellIntegration = true;
  };
}
