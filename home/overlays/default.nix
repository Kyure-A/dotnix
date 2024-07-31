{ emacs-overlay, rust-overlay }:
let
  emacsOverlay = import emacs-overlay;
  rustOverlay = import rust-overlay;
in [ emacsOverlay rustOverlay ]
