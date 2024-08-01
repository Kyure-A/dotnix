{ emacs-overlay, rust-overlay, fenix }:
builtins.catAttrs "default"
(builtins.catAttrs "overlays" [ emacs-overlay rust-overlay fenix ])
