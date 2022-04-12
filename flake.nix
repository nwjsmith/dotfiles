{
  description = "My system";

  inputs = {
    nixpkgs-master.url = "github:nixos/nixpkgs/master";
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    darwin.url = "github:lnl7/nix-darwin/master";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, darwin, home-manager, nixpkgs, nixpkgs-master }:
    let
      inherit (nixpkgs.lib) attrValues;

      nixpkgsConfig = {
        config = { allowUnfree = true; };
        overlays = attrValues self.overlays;
      };
    in
    {
      darwinConfigurations.nsmith165b = darwin.lib.darwinSystem {
        modules = [
          home-manager.darwinModules.home-manager
          ./darwin.nix
          ({ ... }: {
            nixpkgs = nixpkgsConfig;
            users.users.nsmith.home = "/Users/nsmith";
            home-manager = {
              useGlobalPkgs = true;
              users.nsmith = {
                imports = [ ./home.nix ];
              };
            };
          })
        ];
        system = "aarch64-darwin";
      };

      overlays = {
        pkgs-master = final: prev: {
          pkgs-master = import nixpkgs-master {
            inherit (prev.stdenv) system;
            inherit (nixpkgsConfig) config;
          };
          # TODO: remove when https://github.com/NixOS/nixpkgs/pull/166661 hits `nixpkgs-unstable`.
          inherit (final.pkgs-master) kitty topgrade;
        };
      };
    };
}
