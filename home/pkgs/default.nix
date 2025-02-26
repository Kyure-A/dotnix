{ pkgs }:
with pkgs; [
  bun
  delta
  deno
  docker
  dotnet-sdk # C#
  emacs-git
  emacs-lsp-booster
  eza
  gcc
  ghq
  gnumake
  # gnupg
  keybase
  neofetch
  nixd
  nixpkgs-fmt
  nodePackages.typescript-language-server
  omnisharp-roslyn # C#
  openssl
  rust-bin.stable.latest.default
  rust-analyzer
  satysfi
  #tectonic
  tree-sitter
  web-ext # mozilla
  zsh-defer
]
