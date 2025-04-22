{
  self,
  nixpkgs,
  home-manager,
  nixos-wsl,
  overlays,
  org-babel,
  emacs-d
}:
let
  username = "kyre";
  system = "x86_64-linux";
  emacs-config = emacs-d.packages.${system}.default;
in
{
  wsl = nixpkgs.lib.nixosSystem {
    inherit system;
    modules = [
      ../../modules/nixos-wsl
      nixos-wsl.nixosModules.default
      home-manager.nixosModules.home-manager
      {
        home-manager.useUserPackages = true;
        home-manager.users."${username}" = import ../../home {
          inherit
            system
            nixpkgs
            overlays
            org-babel
            emacs-d
            emacs-config
          ;
        };
      }
    ];
    specialArgs = { inherit nixos-wsl; };
  };
}
