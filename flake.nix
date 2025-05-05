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
      rustowl-flake,
      nix-darwin,
      emacs-d,
    }:
    let
      karabiner-elements = (import ./overlays/karabiner-elements.nix);
      
      emacs-no-native-comp = (import ./overlays/emacs-no-native-comp.nix);
      
      overlays = [
        karabiner-elements
        emacs-overlay.overlay
        emacs-no-native-comp
        rust-overlay.overlays.default
        fenix.overlays.default
        rustowl-flake.overlays.default
      ];
    in
      {
        formatter = {
          x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt-rfc-style;
          aarch64-darwin = nixpkgs.legacyPackages.aarch64-darwin.nixfmt-rfc-style;
        };

        darwinConfigurations = (
          import ./hosts/darwin {
            inherit
              self
              nixpkgs
              home-manager
              nix-darwin
              overlays
              emacs-d
            ;
          }
        );

        nixosConfigurations =
          (import ./hosts/wsl {
            inherit
              self
              nixpkgs
              home-manager
              nixos-wsl
              overlays
              emacs-d
            ;
          });
        # // (import ./hosts/x230 {
        #   inherit
        #     self
        #     nixpkgs
        #     home-manager
        #     emacs-config
        #   ;
        # });
      };
}
