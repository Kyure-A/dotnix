{ }: {
  nix = {
    settings.experimental-features = [ "nix-command" "flakes" ];
    optimize = { automatic = true; };
    gc = { automatic = true; };
  };

  time.timeZone = "Asia/Tokyo";

  system = {
    defaults = {
      NSGlobalDomain = {
        NSDocumentSaveNewDocumentsToCloud = false;
        AppleShowAllExtensions = true;
        AppleShowAllFiles = true;
        NSAutomaticCapitalizationEnabled = false;
      };

      finder = {
        AppleShowAllExtensions = true;
        AppleShowAllFiles = true;
      };

      menuExtraClock = {
        Show24Hour = true;
        ShowDate = true;
      };

      trackpad = {
        Clicking = true;
        Dragging = true;
      };
    };
  };
}
