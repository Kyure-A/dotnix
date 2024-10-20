{ pkgs }:
with pkgs; [
  bun
  delta
  deno
  docker
  emacs-git
  emacs-lsp-booster
  eza
  gcc
  ghq
  gnumake
  neofetch
  nixd
  nixpkgs-fmt
  nodePackages.typescript-language-server
  openssl
  rust-bin.stable.latest.default
  rust-analyzer
  satysfi
  tectonic
  tree-sitter
  web-ext # mozilla
  zsh-defer
]
