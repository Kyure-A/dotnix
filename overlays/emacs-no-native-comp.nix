final : prev: {
  emacs-git = prev.emacs-git.override {
    withNativeCompilation = false;
  };
}
