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
      nodejs
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

      # Zig
      zls

      # Go
      gopls

      # Python
      pyright
      ruff

      # Lua
      lua-language-server
      stylua

      # Web
      nodePackages.prettier
      tailwindcss-language-server
      typescript
      typescript-language-server
      eslint

      # YAML
      yamllint

      # TOML
      taplo

      # Docker
      hadolint

      # SQL
      nodePackages.sql-formatter

      # Markdown
      vale
      markdownlint-cli
      markdownlint-cli2
    ];
  };

  xdg.configFile."nvim" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-config/modules/home-manager/nvim";
  };
}
