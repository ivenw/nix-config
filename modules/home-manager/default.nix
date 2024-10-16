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
    atuin
    pipx
    fd
    fzf
    delta
    tokei
    ripgrep
    tree
    zoxide
    mdbook
    unzip
    yazi
    cloc
    graphviz
    jq
    yamllint
    taplo
    tailwindcss
    imagemagick

    # These are needed for rust embedded programming
    # and should be put into the shell
    qemu
    pkg-config

    ###########################
    # Language specific tools #
    ###########################

    # Python
    python3
    rye
    poetry
    ruff

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
