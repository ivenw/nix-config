{
  description = "My nix configuration";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-24.11-darwin";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    nix-darwin = {
      url = "github:LnL7/nix-darwin/nix-darwin-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
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
    pkgs-unstable = import nixpkgs-unstable {
      inherit system;
      config.allowUnfree = true;
    };

    specialArgs =
      inputs
      // {
        inherit hostname username;
        pkgs-unstable = pkgs-unstable;
      };
  in {
    darwinConfigurations.${hostname} = nix-darwin.lib.darwinSystem {
      inherit system specialArgs;
      modules = [
        ./modules/darwin
        home-manager.darwinModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.${username}.imports = [./modules/home-manager];
            extraSpecialArgs = specialArgs;
          };
        }
      ];
    };

    formatter.${system} = nixpkgs.legacyPackages.${system}.alejandra;
  };
}
