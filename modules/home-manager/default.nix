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
    # Buid dependencies
    netcdf
    ninja

    # General cli and tui apps
    git
    slides
    nh
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
    graph-easy

    # Web
    bun
    nodejs
    prettier

    # C / C++
    cmake

    # C#
    dotnet-sdk_10

    # Python
    uv
    ruff

    # Rust
    rustup
    cargo-binstall

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
