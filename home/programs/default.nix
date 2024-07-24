{ pkgs }:
let
  git = import ./git;
  starship = import ./starship;
in
[ git
  starship
]
  
