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
    emacs-overlay.url = "github:nix-community/emacs-overlay";
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager-official, home-manager-kyre, nixos-wsl
    , emacs-overlay, rust-overlay }:
    let
      settings = { useOfficial = false; };
      home-manager = if settings.useOfficial then
        home-manager-official
      else
        home-manager-kyre;
    in {
      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt;

      nixosConfigurations = (import ./systems/wsl {
        inherit self nixpkgs home-manager nixos-wsl emacs-overlay rust-overlay;
      }) // (import ./systems/x230 {
        inherit self nixpkgs home-manager emacs-overlay rust-overlay;
      });
    };
}
