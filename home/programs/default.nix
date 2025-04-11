{ pkgs }:
let
  git = import ./git { inherit pkgs; };
  karabiner = import ./karabiner;
  sheldon = import ./sheldon;
  starship = import ./starship;
  zsh = import ./zsh { inherit pkgs; };
  common = [ git sheldon starship zsh];
  darwin = if pkgs.stdenv.isDarwin then [ karabiner ] else [];
in common ++ darwin
