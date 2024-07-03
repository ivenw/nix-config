{pkgs, ...}: {
  imports = [
    ./git
    ./lazygit
    ./bat
    ./nvim
    ./zsh
    ./starship
    ./zellij
    ./tmux
    ./alacritty
    ./wezterm
  ];

  home = {
    username = "ivenw";
    homeDirectory = "/home/ivenw";
    sessionPath = ["$HOME/.local/bin"];
  };

  # fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    # cli and tui apps
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
    helix
    zoxide
    mdbook
    unzip
    yazi
    cloc
    graphviz

    # linters and formatters
    alejandra
    stylua
    yamllint
    ruff

    # fonts
    # (nerdfonts.override {fonts = ["JetBrainsMono"];})
    # source-sans-pro
    # montserrat
  ];

  # Enable home-manager
  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  # systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.05";
}
