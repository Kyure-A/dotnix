# https://nix-darwin.github.io/nix-darwin/manual/index.html

{ pkgs }: {
  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
  ];

  nix = {
    settings.experimental-features = [ "nix-command" "flakes" ];
    optimize = { automatic = true; };
    gc = { automatic = true; };
  };
  
  system = {
    defaults = {
      CustomUserPreferences = {
        "com.apple.desktopservices" = {
          DSDontWriteNetworkStores = true; # DS_Store
          DSDontWriteUSBStores = true; # DS_Store
        };
      };
      
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

  time.timeZone = "Asia/Tokyo";
}
