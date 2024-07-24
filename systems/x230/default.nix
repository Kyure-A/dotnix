{ self, nixpkgs, home-manager, emacs-overlay }:
let
  username = "kyre";
  system = "x86_64-linux";
in {
  wsl = nixpkgs.lib.nixosSystem {
    inherit system;
    modules = [
      ../../nixos
      ./hardware-configurations.nix
      home-manager.nixosModules.home-manager {
        home-manager.useUserPackages = true;
        home-manager.users."${username}" = import ../../home { inherit system nixpkgs emacs-overlay; };
      }
    ];
  };
}
