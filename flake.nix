{
  description = "My system";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    darwin.url = "github:lnl7/nix-darwin/master";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, darwin, home-manager, nixpkgs }:
    let
      system = "aarch64-darwin";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      devShell.${system} = pkgs.mkShell { buildInputs = [ pkgs.nixfmt ]; };
      darwinConfigurations.nsmith165b = darwin.lib.darwinSystem {
        inherit system;

        modules = [
          home-manager.darwinModules.home-manager
          ./darwin.nix
          ({ ... }: {
            nixpkgs = { config = { allowUnfree = true; }; };
            users.users.nsmith.home = "/Users/nsmith";
            home-manager = {
              useGlobalPkgs = true;
              users.nsmith = { imports = [ ./home.nix ]; };
            };
          })
        ];
      };
    };
}
