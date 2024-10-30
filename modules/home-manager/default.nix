{
  pkgs,
  pkgs-unstable,
  ...
}: {
  imports = [
    ./git
    ./lazygit
    ./bat.nix
    ./nvim
    ./zsh.nix
    ./starship.nix
    ./tmux
    ./alacritty
    ./wezterm
    ./aerospace
    ./nix-direnv.nix
  ];

  home.packages = with pkgs; [
    # General cli and tui apps
    azure-cli
    pipx
    fd
    fzf
    delta
    tokei
    pkgs-unstable.ripgrep
    tree
    zoxide
    mdbook
    unzip
    pkgs-unstable.yazi
    graphviz
    pkgs-unstable.jq
    imagemagick

    ###########################
    # Language specific tools #
    ###########################

    # Config files and co
    yamllint
    taplo

    # Web
    pkgs-unstable.tailwindcss
    pkgs-unstable.nodePackages.browser-sync

    # Python
    python3
    pkgs-unstable.rye
    pkgs-unstable.ruff

    # Rust
    rustup

    # Go
    go

    # Zig
    zig

    # Terraform
    terraform
    opentofu
  ];

  # Enable home-manager
  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  # systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.05";
}
