{
  description = "My nix configuration";
  inputs = let version = "24.05"; in {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-${version}-darwin";

    nix-darwin = { 
      url = "github:LnL7/nix-darwin"; 
      inputs.nixpkgs.follows = "nixpkgs"; 
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-${version}";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    nix-darwin,
    home-manager,
    ...
  }: let
    hostname = "midnight";
    username = "ivenw";
    system = "aarch64-darwin";
  in {
    darwinConfigurations.${hostname} = nix-darwin.lib.darwinSystem {
      modules = [
        ./modules/darwin/system.nix
        ./modules/darwin/homebrew.nix
        # home-manager.darwinModules.home-manager
        # {
        #   home-manager = {
        #     useGlobalPkgs = true;
        #     useUserPackages = true;
        #     users.${username}.imports = [./modules/home-manager];
        #   };
        # }
      ];
    };

    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations.${hostname}.pkgs;
    specialArgs = { inherit hostname username inputs; };

    formatter.${system} = nixpkgs.legacyPackages.${system}.alejandra;
  };
}
