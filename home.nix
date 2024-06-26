{ inputs, config, pkgs, ... }:

{
  imports = [
    ./git.nix
    ./neovim
    ./nushell.nix
    ./tmux.nix
    ./zsh.nix
  ];

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "haodeon";
  home.homeDirectory = "/home/haodeon";

  home.packages = [
    pkgs.dotnet-sdk_8
    pkgs.exercism
    pkgs.minikube
    pkgs.mosh
    pkgs.unison-ucm
  ];

  home.sessionVariables = {
    DOTNET_ROOT = "${config.home.profileDirectory}";
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.gh = {
    enable = true;
    settings = {
      version = "1";
    };
    settings.aliases = {
      co = "pr checkout";
    };
    settings.editor = "nvim";
  };

  programs.bottom.enable = true;

  nixpkgs.overlays = [
    (final: prev: {
      mosh = prev.mosh.overrideAttrs ({ postInstall ? "", ... }: {
        postInstall = postInstall + ''
          wrapProgram $out/bin/mosh-server --set LOCALE_ARCHIVE ${pkgs.glibcLocales}/lib/locale/locale-archive;
        '';
      });
    })
  ];
}
