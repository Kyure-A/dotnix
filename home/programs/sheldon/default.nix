{ pkgs }: {
  home.file = {
    "plugins.toml".source = ./plugins.toml;
  };
  home.packages = [pkgs.sheldon];
}
