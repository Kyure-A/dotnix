{ pkgs }:
let
  git = import ./git;
  sheldon = import ./sheldon;
  starship = import ./starship;
  zsh = import ./zsh { inherit pkgs; };
in
[ git
  sheldon
  starship
  zsh
]
  
