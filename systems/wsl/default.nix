{ self, nixpkgs, home-manager, nixos-wsl, emacs-overlay, rust-overlay, fenix }:
let
  username = "kyre";
  system = "x86_64-linux";
in {
  wsl = nixpkgs.lib.nixosSystem {
    inherit system;
    modules = [
      ../../modules/base
      ../../modules/nixos-wsl
      nixos-wsl.nixosModules.default
      home-manager.nixosModules.home-manager
      {
        home-manager.useUserPackages = true;
        home-manager.users."${username}" = import ../../home {
          inherit system nixpkgs emacs-overlay rust-overlay fenix;
        };
      }
    ];
    specialArgs = { inherit nixos-wsl; };
  };
}
