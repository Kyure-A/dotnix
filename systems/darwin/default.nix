{
  self,
  nixpkgs,
  home-manager,
  nix-darwin,
  overlays,
  org-babel,
}:
let
  system = "aarch64-darwin";
  username = "kyre";
  configuration =
    { ... }:
    {
      users.users.${username}.home = "/Users/${username}";
    };
in
{
  darwin = nix-darwin.lib.darwinSystem {
    inherit system;
    specialArgs = { inherit username; };
    modules = [
      configuration
      ../../modules/nix-darwin
      home-manager.darwinModules.home-manager
      {
        home-manager.useUserPackages = true;
        home-manager.users."${username}" = import ../../home {
          inherit
            system
            nixpkgs
            overlays
            org-babel
            ;
        };
      }
    ];
  };
}
