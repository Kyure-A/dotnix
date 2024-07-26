{ pkgs, ... } :
let
  load-zsh-defer = ''source "${pkgs.zsh-defer}/share/zsh-defer/zsh-defer.plugin.zsh"'';
  load-sheldon = ''eval "$(sheldon source)"'';
  text = load-zsh-defer + "\n" + load-sheldon;
in {
  home.file = {
    ".zshrc".source = pkgs.writeText ".zshrc" text;
  };
  programs.zsh = {
    enable = true;
  };
}
