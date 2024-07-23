{ self, nixpkgs, emacs-overlay, nixos-wsl }: {
  wsl = nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = [
      ../../nixos-wsl/default.nix
      nixos-wsl.nixosModules.default
    ];
    specialArgs = {
      nixos-wsl = nixos-wsl;
    };
  };
}
