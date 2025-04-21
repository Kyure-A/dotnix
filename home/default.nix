{
  system,
  nixpkgs,
  overlays,
  org-babel,
  emacs-config
}:
let
  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;
    overlays = import ./overlays {
      inherit overlays;
    };
  };

  programs = import ./programs { inherit pkgs emacs-config; };
in
{
  imports = programs ++ [ emacs-config.homeModules.${system}.twist ];
  home.packages = import ./pkgs { inherit pkgs; };

  home.stateVersion = "24.11";
}
