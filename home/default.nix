{ system, nixpkgs, emacs-overlay }:
let
  lib = nixpkgs.lib;

  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;
    overlays = import ./overlays { inherit emacs-overlay; };
  };
  
  programs = import ./programs { inherit pkgs; };
in {
  imports = programs;
  home.packages = import ./packages { inherit pkgs; };
  
  home.stateVersion = "24.11";
}
