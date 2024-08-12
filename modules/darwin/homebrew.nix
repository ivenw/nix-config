{...}: {
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = false;
      # 'zap': uninstalls all formulae(and related files) not listed here.
      # cleanup = "zap";
    };

    tabs = [
    ];

    brews = [
    ];

    casks = [
      "sonos",
      "steam",
      "whisky",
      "raycast",
      "wezterm",
      "bruno",
      "whatsapp",
      "discord",
      "slack",
      "microsoft-teams",
      "visual-studio-code",
      "zed",
    ];

    masApps = [
      "Adblock for Safari" = 1402042596
      "Vimari" = 1480933944
      "Yr" = 490989206
    ];
  };
}