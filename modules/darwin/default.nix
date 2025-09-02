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
  # nix.package = pkgs.nix;
  # nix.settings.experimental-features = [
  #   "nix-command"
  #   "flakes"
  # ];
  # nix.settings.trusted-users = [username];
  # do garbage collection to keep disk usage low
  # requires nix.enable
  # nix.gc = {
  #   automatic = lib.mkDefault true;
  #   options = lib.mkDefault "--delete-older-than 30d";
  # };

  # Disable auto-optimise-store because of this issue:
  #   https://github.com/NixOS/nix/issues/7273
  # nix.settings = {
  #   auto-optimise-store = false;
  # };

  system.stateVersion = 5;
  system.primaryUser = username;
  system.keyboard = {
    enableKeyMapping = true;
    remapCapsLockToEscape = true;
  };
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

  environment.systemPackages = with pkgs; [
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  security.pam.services.sudo_local.touchIdAuth = true;

  nixpkgs.config.allowUnfree = true;

  # Create /etc/zshrc that loads the nix-darwin environment.
  programs.zsh.enable = true;

  users.users.${username} = {
    home = "/Users/${username}";
  };
}
