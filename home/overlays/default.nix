{ emacs-overlay, rust-overlay, fenix }:
let
  emacsOverlay = import emacs-overlay;
  rustOverlay = import rust-overlay;
in [ emacsOverlay rustOverlay fenix.overlays.default ]
