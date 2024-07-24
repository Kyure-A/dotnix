{ self, nixpkgs, emacs-overlay, nixos-wsl }: {
  wsl = nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = [
      ../../nixos-wsl
      nixos-wsl.nixosModules.default
    ];
    specialArgs = {
      inherit nixos-wsl;
    };
  };
}
