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
      "ollama"
    ];

    casks = [
      # System
      "raycast"
      "aerospace"
      "tunnelblick"

      # Gaming
      "steam"
      "whisky"

      # Browsers
      "google-chrome"

      # Messaging
      "microsoft-teams"
      "whatsapp"
      "discord"
      "slack"
      "mattermost"

      # Development
      # "docker"
      "alacritty"
      "ghostty"
      "visual-studio-code"
      "zed"
      "bruno"

      # Media
      "sonos"
      "calibre"
      "kobo"
    ];

    masApps = {
      "Adblock for Safari" = 1402042596;
      "Vimari" = 1480933944;
      "1Password for Safari" = 1569813296;
      "Xcode" = 497799835;
    };
  };
}
