{
  system,
  nixpkgs,
  overlays,
  org-babel,
  emacs-d,
  emacs-config
}:
let
  pkgs = import nixpkgs {
    inherit system overlays;
    config.allowUnfree = true;
  };

  programs = import ./programs { inherit pkgs emacs-config; };
in
{
  imports = programs ++ [ emacs-d.homeModules.${system}.twist ];
  home.packages = import ./pkgs { inherit pkgs; };

  home.stateVersion = "24.11";
}
