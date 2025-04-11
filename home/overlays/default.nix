{ overlays }:
builtins.catAttrs "default" (builtins.catAttrs "overlays" (with overlays; [
  emacs
  rust
  fenix
  rustowl
  karabiner-elements
]))
