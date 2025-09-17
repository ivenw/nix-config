{pkgs, ...}: {
  imports = [
    ./git
    ./lazygit
    ./bat.nix
    ./nvim
    ./helix
    ./zsh.nix
    ./starship.nix
    ./tmux
    ./ghostty
    ./aerospace
    ./nix-direnv.nix
  ];

  home.packages = with pkgs; [
    # General cli and tui apps
    azure-cli
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
    graphviz
    jq
    imagemagick

    # Web
    bun
    nodejs

    # Python
    uv

    # Rust
    rustup

    # Go
    go

    # Zig
    zig

    # Terraform
    tenv
  ];

  # Enable home-manager
  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  # systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.05";
}
