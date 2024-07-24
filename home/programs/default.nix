{ pkgs }:
let
  git = import ./git;
  starship = import ./starship;
  zsh = import ./zsh;
in
[ git
  starship
  zsh
]
  
