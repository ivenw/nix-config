{
  self,
  pkgs,
  system,
  hostname,
  username,
  ...
}: {
  environment.systemPackages = with pkgs; [
  ];

  fonts.packages = with pkgs; [
    (nerdfonts.override { 
      fonts = [ 
        "JetBrainsMono" 
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
    }
  };

  security.pam.enableSudoTouchIdAuth = true;

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  nix.package = pkgs.nix;

  nix.settings.experimental-features = ["nix-command" "flakes"];
  nix.settings.trusted-users = [ username ];

  # Create /etc/zshrc that loads the nix-darwin environment.
  programs.zsh.enable = true;

  users.users.${username} = {
    home = "/Users/${username}";
  };

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = system;
}
