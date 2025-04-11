{
  system,
  nixpkgs,
  overlays,
  org-babel,
}:
let
  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;
    overlays = import ./overlays {
      inherit overlays;
    };
  };

  programs = import ./programs { inherit pkgs; };
in
{
  imports = programs;
  home.packages = import ./pkgs { inherit pkgs; };

  home.stateVersion = "24.11";
}
