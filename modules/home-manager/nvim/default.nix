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
      ruff
      ty

      # Lua
      lua-language-server
      stylua

      # Web
      prettier
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
      sql-formatter

      # Markdown
      vale
      markdownlint-cli
      markdownlint-cli2
    ];
  };

  # home-manager 26.05 disallows symlinking a directory that contains files it
  # considers outside $HOME (e.g. default.nix, lazy-lock.json co-located here).
  # Symlink only the nvim config entries instead of the whole directory.
  xdg.configFile."nvim/init.lua".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-config/modules/home-manager/nvim/init.lua";
  xdg.configFile."nvim/lua".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-config/modules/home-manager/nvim/lua";
  xdg.configFile."nvim/after".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-config/modules/home-manager/nvim/after";
}
