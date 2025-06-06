{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, flake-utils, rust-overlay }:
    flake-utils.lib.eachDefaultSystem (system:
    let
      pkgs = import nixpkgs {
        inherit system;
        overlays = [
          rust-overlay.overlays.default
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
          pkgs.kluctl
          pkgs.kubectl
          pkgs.kubelogin
          pkgs.kubernetes-helm
        ];
      };
      devShells.lua = pkgs.mkShell {
        buildInputs = with pkgs; [
          (lua5_4.withPackages (ps: with ps; [ busted ]))
        ];
      };
      devShells.node = pkgs.mkShell {
        packages = [
          pkgs.nodejs_22
          pkgs.nodejs_22.pkgs.pnpm
        ];
      };
      devShells.python = pkgs.mkShell {
        buildInputs = with pkgs; [
          python3
          python3Packages.pytest
          python3Packages.pytest-subtests
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
    });
}

