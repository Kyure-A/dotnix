{
  programs.alacritty = {
    enable = true;
    settings = {
      terminal = {
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
  };
}
