{
  self,
  nixpkgs,
  home-manager,
  nixos-wsl,
  overlays,
  org-babel,
  emacs-config
}:
let
  username = "kyre";
  system = "x86_64-linux";
in
{
  wsl = nixpkgs.lib.nixosSystem {
    inherit system;
    modules = [
      ../../modules/nixos-wsl
      nixos-wsl.nixosModules.default
      home-manager.nixosModules.home-manager
      emacs-config.homeModules.${system}.twist
      {
        home-manager.useUserPackages = true;
        home-manager.users."${username}" = import ../../home {
          inherit
            system
            nixpkgs
            overlays
            org-babel
            emacs-config
          ;
        };
      }
    ];
    specialArgs = { inherit nixos-wsl; };
  };
}
