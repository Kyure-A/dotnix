{ pkgs }:
let
  git = import ./git;
  sheldon = import ./sheldon  { inherit pkgs; };
  starship = import ./starship;
  zsh = import ./zsh;
in
[ git
  sheldon
  starship
  zsh
]
  
