{
  description = "Kyure_A's NixOS Config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager-official = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager-kyre = {
      url = "github:Kyure-A/home-manager/master";
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
  };

  outputs = { self, nixpkgs, home-manager-official, home-manager-kyre, nixos-wsl
    , emacs-overlay, rust-overlay, fenix, org-babel, rustowl-flake, nix-darwin
    }:
    let
      settings = { useOfficial = false; };
      home-manager = if settings.useOfficial then
        home-manager-official
      else
        home-manager-kyre;
    in {
      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt;

      darwinConfigurations = (import ./systems/darwin {
        inherit self nixpkgs home-manager nix-darwin emacs-overlay rust-overlay
          fenix org-babel rustowl-flake;
      });

      nixosConfigurations = (import ./systems/wsl {
        inherit self nixpkgs home-manager nixos-wsl emacs-overlay rust-overlay
          fenix org-babel rustowl-flake;
      }) // (import ./systems/x230 {
        inherit self nixpkgs home-manager emacs-overlay rust-overlay fenix
          org-babel;
      });
    };
}
