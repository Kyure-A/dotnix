{
  config,
  lib,
  pkgs,
  ...
}:
{

  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
  };

  sound.enable = true;

  services = {
    xserver = {
      desktopManager.gnome.enable = true;
    };
  };
}
