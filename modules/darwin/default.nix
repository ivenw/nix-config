{
  pkgs,
  lib,
  username,
  ...
}: {
  imports = [
    ./homebrew.nix
  ];

  nix.enable = false;

  system.stateVersion = 5;

  environment.systemPackages = with pkgs; [
  ];

  fonts.packages = with pkgs; [
    (nerdfonts.override {
      fonts = [
        "JetBrainsMono"
        "ZedMono"
        "IBMPlexMono"
        "FiraCode"
        "Hack"
      ];
    })
  ];

  system.defaults = {
    dock = {
      autohide = true;
      show-recents = false;
    };

    NSGlobalDomain = {
      AppleShowAllExtensions = true;
      "com.apple.mouse.tapBehavior" = 1; # Tap to click
      ApplePressAndHoldEnabled = true;
    };

    CustomUserPreferences = {
      # Disable font smoothing for alacritty
      "org.alacritty" = {
        "AppleFontSmoothing" = 0;
      };
    };
  };

  system.keyboard = {
    enableKeyMapping = true;
    remapCapsLockToEscape = true;
  };

  security.pam.enableSudoTouchIdAuth = true;

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  nix.package = pkgs.nix;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  nix.settings.trusted-users = [username];

  nixpkgs.config.allowUnfree = true;

  # Create /etc/zshrc that loads the nix-darwin environment.
  programs.zsh.enable = true;

  users.users.${username} = {
    home = "/Users/${username}";
  };

  # do garbage collection to keep disk usage low
  nix.gc = {
    automatic = lib.mkDefault true;
    options = lib.mkDefault "--delete-older-than 30d";
  };

  # Disable auto-optimise-store because of this issue:
  #   https://github.com/NixOS/nix/issues/7273
  nix.settings = {
    auto-optimise-store = false;
  };
}
