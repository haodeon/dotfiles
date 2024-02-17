{ inputs, config, pkgs, ... }:

{
  imports = [
    ./git.nix
    ./neovim
    ./nushell.nix
    ./tmux.nix
    ./zsh.nix
  ];

  home.username = "deon";
  home.homeDirectory = "/home/deon";

  home.packages = [
    pkgs.azure-cli
    pkgs.dotnet-sdk_8
  #  (pkgs.fenix.stable.withComponents [
  #    "cargo"
  #    "rust-src"
  #    "rust-std"
  #    "rustc"
  #  ])
  ];

  home.sessionVariables = {
    DOTNET_ROOT = "${config.home.profileDirectory}";
    PNPM_HOME = "${config.home.homeDirectory}/.local/share/pnpm";
  };

  home.stateVersion = "23.05";

  programs.home-manager.enable = true;

  programs.zsh = {
    historySubstringSearch = {
      searchUpKey = "^[OA";
      searchDownKey = "^[OB";
    };
    initExtra = ''
      case ":$PATH:" in
      *":$PNPM_HOME:"*) ;;
      *) export PATH="$PNPM_HOME:$PATH" ;;
      esac
    '';
    profileExtra = ''
      if [ -e /home/deon/.nix-profile/etc/profile.d/nix.sh ]; then . /home/deon/.nix-profile/etc/profile.d/nix.sh; fi
    '';
  };

  programs.git = {
    extraConfig = {
      credential.helper = "/mnt/c/Program\\ Files/Git/mingw64/bin/git-credential-manager.exe";
    };
  };


  #nixpkgs.overlays = [ inputs.fenix.overlays.default ];
}
