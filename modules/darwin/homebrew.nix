{...}: {
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = false;
      # 'zap': uninstalls all formulae(and related files) not listed here.
      cleanup = "zap";
    };

    taps = [
      "nikitabobko/tap"
    ];

    brews = [
      "glab"
      "gh"
    ];

    casks = [
      "sonos"
      "steam"
      "whisky"
      "raycast"
      "wezterm"
      "bruno"
      "whatsapp"
      "discord"
      "slack"
      "microsoft-teams"
      "visual-studio-code"
      "zed"
      "aerospace"
    ];

    masApps = {
      "Adblock for Safari" = 1402042596;
      "Vimari" = 1480933944;
      "1Password for Safari" = 1569813296;
    };
  };
}
