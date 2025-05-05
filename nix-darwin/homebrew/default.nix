{
  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      upgrade = true;
      cleanup = "uninstall";
    };

    brews = [
      "docker-compose"
      "pinentry-mac"
    ];

    casks = [
      "alacritty"
      "alcom"
      "chatgpt"
      "claude"
      "docker"
      "firefox"
      "postman"
      "raycast"
      "unity-hub"
      "warp"
    ];

    masApps = {
      GoodNotes = 1444383602;
      Runcat = 1429033973;
      SwiftPlaygrounds = 1496833156;
      Xcode = 497799835;
    };
  };
}
