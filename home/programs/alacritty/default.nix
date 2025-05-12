{
  programs.alacritty = {
    enable = true;
    shell = {
      program = "zsh";
      args = [
        "-l"
        "-c"
        "tmux a -t 0 || tmux"
      ];
    };
  };
}
