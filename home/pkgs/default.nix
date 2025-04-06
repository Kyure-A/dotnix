{ pkgs }:
with pkgs;
let
  common = [
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
    glance
    gnumake
    gnupg
    keybase
    neofetch
    nixd
    nixpkgs-fmt
    nodePackages.typescript-language-server
    omnisharp-roslyn # C#
    openssl
    pinentry-all
    rust-bin.stable.latest.default
    rust-analyzer
    satysfi
    # tectonic
    tree-sitter
    web-ext # mozilla
    zsh-defer
  ];

  nonDarwin = if !stdenv.isDarwin then [ pinentry-all ] else [ ];
  darwin = if stdenv.isDarwin then [ warp-terminal ] else [ ];
in common ++ nonDarwin ++ darwin
