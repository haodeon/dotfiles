{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-utils.follows = "flake-utils";
    };
    unison-nix = {
      url = "github:ceedubs/unison-nix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-utils.follows = "flake-utils";
    };
  };

  outputs = { self, nixpkgs, flake-utils, rust-overlay, unison-nix }:
    flake-utils.lib.eachDefaultSystem (system:
    let
      pkgs = import nixpkgs {
        inherit system;
        overlays = [
          rust-overlay.overlays.default
          unison-nix.overlay
        ];
      };
      toolchain = pkgs.rust-bin.fromRustupToolchainFile ./toolchain.toml;
    in {
      devShells.cobol = pkgs.mkShell {
        packages = [
          pkgs.gmp
          pkgs.gnu-cobol.bin
          pkgs.jdk17_headless
        ];
      };
      devShells.clojure = pkgs.mkShell {
        packages = [
          pkgs.jdk17_headless
          pkgs.leiningen
        ];
      };
      devShells.k8s = pkgs.mkShell {
        packages = [
          pkgs.k9s
          pkgs.kind
          pkgs.kluctl
          pkgs.kubectl
        ];
      };
      devShells.node = pkgs.mkShell {
        packages = [
          pkgs.nodejs-18_x
          pkgs.nodejs-18_x.pkgs.pnpm
        ];
      };
      devShells.python = pkgs.mkShell {
        buildInputs = with pkgs; [
          poetry
          (python3.withPackages (ps: with ps; [ black pytest pytest-subtests ]))
        ]
        ++ lib.optionals stdenv.isDarwin [
          libffi
          openssl
          darwin.apple_sdk.frameworks.CoreServices
        ];

#        shellHook = with pkgs; ''
#          source $(poetry env info -p)/bin/activate

          # Nope, it's too slow
          # poetry shell --no-root
#        '';
      };
      devShells.rust = pkgs.mkShell {
        packages = [
          toolchain
        ];
        RUST_SRC_PATH = "${toolchain}/lib/rustlib/src/rust/library";
      };
      devShells.unison = pkgs.mkShell {
        packages = [
          pkgs.unison-ucm
        ];
      };
    });
}

