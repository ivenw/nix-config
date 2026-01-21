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
      # System
      "aerospace"
      "tunnelblick"
      "kopiaui"

      # Gaming
      "steam"

      # Browsers
      "google-chrome"

      # Messaging
      "slack"
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
  };
}
