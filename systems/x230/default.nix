{ self, nixpkgs, home-manager, emacs-overlay, rust-overlay, fenix }:
let
  username = "kyre";
  system = "x86_64-linux";
in {
  x230 = nixpkgs.lib.nixosSystem {
    inherit system;
    modules = [
      ../../modules/base
      ../../modules/nixos
      ./hardware-configurations.nix
      home-manager.nixosModules.home-manager
      {
        home-manager.useUserPackages = true;
        home-manager.users."${username}" = import ../../home {
          inherit system nixpkgs emacs-overlay rust-overlay fenix;
        };
      }
    ];
  };
}
