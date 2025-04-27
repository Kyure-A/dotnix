{
  description = "Kyure_A's NixOS Config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    emacs-overlay.url = "github:nix-community/emacs-overlay";
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    fenix = {
      url = "github:nix-community/fenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    org-babel.url = "github:emacs-twist/org-babel";
    rustowl-flake.url = "github:mrcjkb/rustowl-flake";
    emacs-d = {
      url = "github:Kyure-A/.emacs.d";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      nixos-wsl,
      emacs-overlay,
      rust-overlay,
      fenix,
      org-babel,
      rustowl-flake,
      nix-darwin,
      emacs-d,
    }:
    let
      overlays = {
        karabiner-elements = (import ./overlays/karabiner-elements.nix);
        emacs = emacs-overlay.overlay;
        emacs-no-native-comp = (import ./overlays/emacs-no-native-comp.nix);
        rust = rust-overlay.overlays.default;
        fenix = fenix.overlays.default;
        rustowl = rustowl-flake.overlays.default;
      };
    in
      {
        formatter = {
          x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt-rfc-style;
          aarch64-darwin = nixpkgs.legacyPackages.aarch64-darwin.nixfmt-rfc-style;
        };

        darwinConfigurations = (
          import ./systems/darwin {
            inherit
              self
              nixpkgs
              home-manager
              nix-darwin
              overlays
              org-babel
              emacs-d
            ;
          }
        );

        nixosConfigurations =
          (import ./systems/wsl {
            inherit
              self
              nixpkgs
              home-manager
              nixos-wsl
              overlays
              org-babel
              emacs-d
            ;
          });
        # // (import ./systems/x230 {
            #   inherit
            #     self
            #     nixpkgs
            #     home-manager
            #     org-babel
            #     emacs-config
            #   ;
            # });
      };
}
