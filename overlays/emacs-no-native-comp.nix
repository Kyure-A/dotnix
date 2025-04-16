(final : prev: {
  emacs = prev.emacs.override {
    withNativeCompilation = false;
  };
  emacs-git = prev.emacs-git.override {
    withNativeCompilation = false;
  };
})

