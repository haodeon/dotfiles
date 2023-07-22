{
  description = "Home Manager configuration of haodeon";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    fenix = {
      url = "github:nix-community/fenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    astronvim = {
      url = "github:AstroNvim/AstroNvim";
      flake = false;
    };
  };

  outputs = { nixpkgs, home-manager, ... } @ inputs:
    let
      #system = "x86_64-linux";
      #pkgs = nixpkgs.legacyPackages.${system};
    in {
      homeConfigurations.haodeon = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages."x86_64-linux";

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [ ./home.nix ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
        extraSpecialArgs = { inherit inputs; };
      };
      homeConfigurations.oldmac = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages."x86_64-darwin";

        modules = [ ./oldmac.nix ];

        extraSpecialArgs = { inherit inputs; };
      };
      homeConfigurations.wsl = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages."x86_64-linux";

        modules = [ ./wsl.nix ];

        extraSpecialArgs = { inherit inputs; };
      };
    };
}

