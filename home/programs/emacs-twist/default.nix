{ emacs-config } : {
  programs.emacs-twist = {
    enable = true;
    emacsclient.enable = true;
    config = emacs-config;
  };
}
