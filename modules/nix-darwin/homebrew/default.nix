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
      "alcom"
      "chatgpt"
      "claude"
      # "firefox@nightly"
      "nikitabobko/tap/aerospace"
      "unity-hub"
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
