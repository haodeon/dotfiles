{ inputs, config, pkgs, ... }:

{
  imports = [
    ./dev
    ./git.nix
    ./neovim
    ./shells.nix
    ./terminal.nix
  ];

  home.username = "deon";
  home.homeDirectory = "/home/deon";

  home.packages = [
    pkgs.azure-cli
    pkgs.oci-cli
  #  (pkgs.fenix.stable.withComponents [
  #    "cargo"
  #    "rust-src"
  #    "rust-std"
  #    "rustc"
  #  ])
  ];

  home.sessionVariables = {
    PNPM_HOME = "${config.home.homeDirectory}/.local/share/pnpm";
  };

  home.sessionPath = [
    "${config.home.homeDirectory}/.local/share/pnpm"
    "/mnt/c/8th/current/bin/lin64"
  ];

  home.file.".pengwinbackupignore".text = ''
    .cache
    .nuget
    .local/share/nvim/lazy
    .local/share/nvim/mason/packages
    .local/share/pnpm/nodejs
    .local/share/pnpm/store
  '';

  home.stateVersion = "23.05";

  programs.home-manager.enable = true;

  programs.zsh = {
    # initContent = ''
    # '';
    profileExtra = ''
      if [ -e /home/deon/.nix-profile/etc/profile.d/nix.sh ]; then . /home/deon/.nix-profile/etc/profile.d/nix.sh; fi
    '';
  };

  programs.git = {
    settings = {
      credential.helper = "/mnt/c/Program\\ Files/Git/mingw64/bin/git-credential-manager.exe";
    };
  };

  #nixpkgs.overlays = [ inputs.fenix.overlays.default ];
}
