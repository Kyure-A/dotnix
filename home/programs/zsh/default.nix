{
  programs.zsh = {
    enable = true;
    initExtra = ''
    eval "$(sheldon source)"
    '';
  };
}
