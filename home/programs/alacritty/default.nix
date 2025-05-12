{
  programs.alacritty = {
    enable = true;
    settings = {
      shell = {
        program = "zsh";
        args = [
          "-l"
          "-c"
          "tmux a -t 0 || tmux"
        ];
      };
    };
  };
}
