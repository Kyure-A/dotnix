{ system, nixpkgs, emacs-overlay, rust-overlay }:
let
  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;
    overlays = import ./overlays { inherit emacs-overlay rust-overlay; };
  };

  programs = import ./programs { inherit pkgs; };
in {
  imports = programs;
  home.packages = import ./pkgs { inherit pkgs; };

  home.stateVersion = "24.11";
}
