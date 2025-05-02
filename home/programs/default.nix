{ pkgs, emacs-config, node2nix }:
let
  copilot-language-server = import ./copilot-language-server { inherit pkgs node2nix;};
  emacs-twist = import ./emacs-twist { inherit emacs-config; };
  git = import ./git { inherit pkgs; };
  karabiner = import ./karabiner;
  sheldon = import ./sheldon;
  starship = import ./starship;
  zsh = import ./zsh { inherit pkgs; };
  common = [
    copilot-language-server
    emacs-twist
    git
    sheldon
    starship
    zsh
  ];
  darwin = if pkgs.stdenv.isDarwin then [ karabiner ] else [ ];
in
common ++ darwin
