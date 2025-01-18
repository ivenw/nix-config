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
      # "docker"
      "sonos"
      "steam"
      "whisky"
      "raycast"
      "alacritty"
      "ghostty"
      "wezterm"
      "bruno"
      "whatsapp"
      "discord"
      "slack"
      "microsoft-teams"
      "visual-studio-code"
      "google-chrome"
      "zed"
      "aerospace"
      "mattermost"
      "tunnelblick"
    ];

    masApps = {
      "Adblock for Safari" = 1402042596;
      "Vimari" = 1480933944;
      "1Password for Safari" = 1569813296;
    };
  };
}
