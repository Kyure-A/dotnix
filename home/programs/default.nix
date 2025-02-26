{ pkgs }:
let
  git = import ./git { inherit pkgs; };
  sheldon = import ./sheldon;
  starship = import ./starship;
  zsh = import ./zsh { inherit pkgs; };
  gnupg = import ./gnupg;
in [ git sheldon starship zsh gnupg ]

