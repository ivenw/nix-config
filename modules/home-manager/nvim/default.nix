{
  config,
  pkgs,
  ...
}: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    extraPackages = with pkgs; [
      # treesitter
      gcc
      nodejs_18
      tree-sitter

      # Linting & formatting lsp
      efm-langserver

      # Bash
      shellcheck
      shfmt

      # Nix
      nil
      alejandra

      # terraform
      terraform-ls
      tflint

      # zig
      zls

      # go
      gopls

      # Python
      pyright
      ruff-lsp
      ruff

      # Lua
      lua-language-server
      stylua

      nodePackages.prettier

      # YAML
      yamllint
    ];
  };

  xdg.configFile."nvim" = {
    source =
      config.lib.file.mkOutOfStoreSymlink
      "${config.home.homeDirectory}/nix-config/modules/home-manager/nvim";
  };
}
