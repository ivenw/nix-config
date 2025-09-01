{
  description = "My nix configuration";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-25.05-darwin";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    nix-darwin = {
      url = "github:LnL7/nix-darwin/nix-darwin-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    nixpkgs-unstable,
    nix-darwin,
    home-manager,
    ...
  }: let
    hostname = "liskov";
    username = "ivenw";
    system = "aarch64-darwin";

    # Create overlay that pulls specific packages from unstable
    unstableOverlay = final: prev: let
      unstable = import nixpkgs-unstable {
        inherit system;
        config.allowUnfree = true;
      };
    in {
      # Dynamically overlay any package that exists in unstable
      inherit
        (unstable)
        # CLI and TUI
        neovim
        helix
        ripgrep
        yazi
        jq
        # Languages
        bun
        nodejs
        tailwindcss
        rye
        uv
        ruff
        nodejs_24
        tree-sitter
        efm-langserver
        shellcheck
        shfmt
        nil
        alejandra
        terraform-ls
        tflint
        zls
        gopls
        pyright
        lua-language-server
        stylua
        tailwindcss-language-server
        typescript
        typescript-language-server
        biome
        yamllint
        ;

      # Handle nested packages like nodePackages
      nodePackages =
        prev.nodePackages
        // {
          inherit
            (unstable.nodePackages)
            browser-sync
            prettier
            sql-formatter
            ;
        };
    };
  in {
    darwinConfigurations.${hostname} = nix-darwin.lib.darwinSystem {
      inherit system;
      modules = [
        ./modules/darwin
        home-manager.darwinModules.home-manager
        {
          nixpkgs.overlays = [unstableOverlay];
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.${username}.imports = [./modules/home-manager];
          };
        }
      ];
    };

    formatter.${system} = nixpkgs.legacyPackages.${system}.alejandra;
  };
}
