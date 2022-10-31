{
  description = "My system";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nix-darwin = {
      url = "github:lnl7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-utils.url = "github:numtide/flake-utils";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nix-darwin, emacs-overlay, home-manager, nixpkgs, ... }:
    let
      system = "aarch64-darwin";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      devShell.${system} = pkgs.mkShell { };
      darwinConfigurations.workbook = nix-darwin.lib.darwinSystem {
        inherit system;

        modules = [
          home-manager.darwinModules.home-manager
          ./darwin.nix
          ({ ... }: {
            nixpkgs = {
              config.allowUnfree = true;
            };
            users.users.nsmith.home = "/Users/nsmith";
            home-manager = {
              useGlobalPkgs = true;
              users.nsmith = {
                home.stateVersion = "22.05";
                imports = [ ./home.nix ];
              };
            };
          })
        ];
      };
    };
}
