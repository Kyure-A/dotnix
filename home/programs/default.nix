{ pkgs }:
let
  git = import ./git { inherit pkgs; };
  karabiner = import ./karabiner;
  sheldon = import ./sheldon;
  starship = import ./starship;
  zsh = import ./zsh { inherit pkgs; };
in [ git karabiner sheldon starship zsh ]
