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
    nh
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
    nodePackages.prettier

    # C / C++
    cmake

    # Python
    uv
    ruff

    # Rust
    rustup

    # Go
    go

    # Zig
    zig

    # Terraform
    tenv

    # Writing
    markdownlint-cli2
    vale
    typos
  ];

  # Enable home-manager
  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  # systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.05";
}
