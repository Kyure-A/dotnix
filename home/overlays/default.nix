{ emacs-overlay, rust-overlay, fenix, rustowl-flake }:
builtins.catAttrs "default" (builtins.catAttrs "overlays" [
  emacs-overlay
  rust-overlay
  fenix
  rustowl-flake
])
