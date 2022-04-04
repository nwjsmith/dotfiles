{
  description = "My system";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    darwin.url = "github:lnl7/nix-darwin/master";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, darwin, nixpkgs }: {
    darwinConfigurations.nsmith165b = darwin.lib.darwinSystem {
      modules = [./darwin.nix];
      system = "aarch64-darwin";
    };
  };
}
