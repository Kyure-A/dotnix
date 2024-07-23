{
  description = "Kyure_A's NixOS Config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    emacs-overlay.url = "github:nix-community/emacs-overlay";
    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL";
      # inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, emacs-overlay, nixos-wsl }: {
    nixosConfigurations = (import ./systems/wsl {
      inherit self nixpkgs emacs-overlay nixos-wsl;
    });
  };
}
