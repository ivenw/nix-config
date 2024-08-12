{pkgs, ...}: {
  imports = [
    ./git
    ./lazygit
    ./bat
    ./nvim
    ./zsh
    ./starship
    ./tmux
    ./alacritty
    ./wezterm
  ];

  # fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    # General cli and tui apps
    atuin
    gh
    azure-cli
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
    bacon

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
