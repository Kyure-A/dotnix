{
  system,
  nixpkgs,
  overlays,
  emacs-d,
  emacs-config
}:
let
  pkgs = import nixpkgs {
    inherit system overlays;
    config.allowUnfree = true;
  };

  node2nix = pkgs.callPackage ../node2nix { inherit pkgs; };
  
  programs = import ./programs { inherit pkgs emacs-config node2nix; };
in
{
  imports = programs ++ [ emacs-d.homeModules.${system}.twist ];
  home.packages = import ./pkgs { inherit pkgs; };

  home.stateVersion = "24.11";
}
