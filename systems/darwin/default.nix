{ self, nixpkgs, home-manager, nix-darwin, emacs-overlay, rust-overlay, fenix
, org-babel, rustowl-flake }:
let
  system = "aarch64-darwin";
  username = "kyre";
in {
  darwin = nix-darwin.lib.darwinSystem {
    inherit system;
    specialArgs = { inherit username; };
    modules = [ ../../modules/nix-darwin ];
  };
}
