{ pkgs }: {
  home.file = {
    ".config/sheldon/plugins.toml".source = ./plugins.toml;
    ".config/sheldon/async".source = ./async;
    ".config/sheldon/sync".source = ./sync;
  };
  home.packages = [pkgs.sheldon];
}
