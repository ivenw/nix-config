{...}: {
  homebrew = {
    enable = false;

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
      # System
      "aerospace"
      "tunnelblick"

      # Gaming
      "steam"

      # Browsers
      "google-chrome"

      # Messaging
      "microsoft-teams"
      "whatsapp"
      "discord"
      "mattermost"

      # Development
      # "docker"
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
