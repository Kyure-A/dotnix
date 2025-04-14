# https://nix-darwin.github.io/nix-darwin/manual/index.html

{ pkgs, ... }:
let
  homebrew = import ./homebrew;
in
{
  imports = [
    homebrew
  ];
  
  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
  ];

  nix = {
    settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
    gc = {
      automatic = true;
    };
  };

  # services = {
  #   karabiner-elements = {
  #     enable = true;
  #     package = pkgs.karabiner-elements;
  #   };
  # };

  system = {
    stateVersion = 6;
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
        "com.apple.swipescrolldirection" = false;
      };

      dock = {
        mineffect = "scale";
        minimize-to-application = true;
      };

      finder = {
        AppleShowAllExtensions = true;
        AppleShowAllFiles = true;
      };

      menuExtraClock = {
        Show24Hour = true;
        ShowDate = 1;
      };

      trackpad = {
        Clicking = true;
        Dragging = true;
      };
    };
  };

  services = {
    aerospace = {
      enable = true;
      settings = {
        # start-at-login = true;
      };
    };
  };

  time.timeZone = "Asia/Tokyo";
}
