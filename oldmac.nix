{ inputs, config, pkgs, ... }:

{
  imports = [
    ./git.nix
    ./neovim
    ./tmux.nix
    ./zsh.nix
  ];

  home.username = "deon";
  home.homeDirectory = "/Users/deon";

  home.packages = [
    pkgs.dotnet-sdk_7
    pkgs.exercism
    (pkgs.fenix.stable.withComponents [
      "cargo"
      "rust-src"
      "rust-std"
      "rustc"
      "rustfmt"
    ])
    pkgs.less
    pkgs.wget2
  ];

  home.sessionVariables = {
    DOTNET_ROOT = "${config.home.profileDirectory}";
  };

  home.stateVersion = "23.05";

  programs.home-manager.enable = true;

  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        normal = {
          family = "IosevkaTerm Nerd Font";
          style = "Regular";
        };
        bold = {
          family = "IosevkaTerm Nerd Font";
          style = "Bold";
        };
        italic = {
          family = "IosevkaTerm Nerd Font";
          style = "Italic";
        };
        bold_italic = {
          family = "IosevkaTerm Nerd Font";
          style = "Bold Italic";
        };
        size = 12;
      };
    };
  };

  programs.zsh = {
    profileExtra = ''
      export PATH="/usr/local/sbin:$PATH"
    '';
  };

  programs.bottom.enable = true;

  nixpkgs.overlays = [ inputs.fenix.overlays.default ];
}
