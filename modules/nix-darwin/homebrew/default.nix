{
  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      upgrade = true;
      cleanup = "uninstall";
    };

    brews = [
      "pinentry-mac"
    ];

    casks = [
      "alacritty"
      "alcom"
      "chatgpt"
      "claude"
      # "firefox@nightly"
      "unity-hub"
      "postman"
      "raycast"
      "warp"
    ];

    masApps = {
      Runcat = 1429033973;
      SwiftPlaygrounds = 1496833156;
      Xcode = 497799835;
    };
  };
}
