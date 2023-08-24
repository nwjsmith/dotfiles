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

  outputs = {
    self,
    nix-darwin,
    home-manager,
    nixpkgs,
    ...
  }: let
    system = "aarch64-darwin";
    pkgs = import nixpkgs {
      inherit system;
      config = {allowUnfree = true;};
    };
  in {
    devShell.${system} = pkgs.mkShell {
      buildInputs = with pkgs; [alejandra nil];
    };
    darwinConfigurations.workbook = nix-darwin.lib.darwinSystem {
      inherit pkgs system;

      modules = [
        home-manager.darwinModules.home-manager
        ./darwin.nix
        ({...}: {
          users.users.nsmith.home = "/Users/nsmith";
          home-manager = {
            useGlobalPkgs = true;
            users.nsmith = import ./home.nix;
          };
        })
      ];
    };
    homeConfigurations.nsmith = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;

      modules = [
        ./home.nix
        {
          home = {
            username = "nsmith";
            homeDirectory = "/Users/nsmith";
          };
        }
      ];
    };
  };
}
