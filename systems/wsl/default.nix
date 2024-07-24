{ self, nixpkgs, home-manager, nixos-wsl, emacs-overlay }: {
  wsl = nixpkgs.lib.nixosSystem rec {
    system = "x86_64-linux";
    modules = [
      ../../nixos-wsl
      nixos-wsl.nixosModules.default
      home-manager.nixosModules.home-manager {
        home-manager.useUserPackages = true;
        home-manager.users.kyre = import ../../home { inherit system nixpkgs emacs-overlay; };
      }
    ];
    specialArgs = {
      inherit nixos-wsl;
    };
  };
}
