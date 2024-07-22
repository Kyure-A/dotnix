{ self, nixpkgs, emacs-overlay, nixos-wsl }: {
  wsl = nixpkgs.lib.nixosSystem {
    modules = [
      ../../nixos-wsl
      nixos-wsl.nixosModules.default
    ];
  };
}
