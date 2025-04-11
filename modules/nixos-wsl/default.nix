{
  config,
  lib,
  pkgs,
  nixos-wsl,
  ...
}:
{
  # https://bombrary.github.io/blog/posts/nixos-wsl-setup/
  imports = [ nixos-wsl.nixosModules.wsl ];

  wsl = {
    enable = true;
    defaultUser = "kyre";
  };
}
