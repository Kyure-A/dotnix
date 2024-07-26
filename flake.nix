{
  description = "Kyure_A's NixOS Config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      #url = "github:nix-community/home-manager/master";
      url = "github:Kyure-A/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    emacs-overlay.url = "github:nix-community/emacs-overlay";
  };

  outputs = { self, nixpkgs, home-manager, nixos-wsl, emacs-overlay }: {
    formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt;

    nixosConfigurations = (import ./systems/wsl {
      inherit self nixpkgs home-manager nixos-wsl emacs-overlay;
    }) // (import ./systems/x230 {
      inherit self nixpkgs home-manager emacs-overlay;
    });
  };
}
