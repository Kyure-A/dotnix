{ emacs-config } : {
  programs.emacs-twist = {
    enable = true;
    config = emacs-config.packages.default;
  };
}
