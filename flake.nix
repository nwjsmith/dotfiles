{
  description = "My system";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    darwin.url = "github:lnl7/nix-darwin/master";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    emacs-overlay.url = "github:nix-community/emacs-overlay";
    emacs-overlay.inputs.nixpkgs.follows = "nixpkgs";
    nix-doom-emacs.url = "github:nix-community/nix-doom-emacs";
    nix-doom-emacs.inputs = {
      nixpkgs.follows = "nixpkgs";
      emacs-overlay.follows = "emacs-overlay";
    };
  };

  outputs =
    { self, darwin, emacs-overlay, home-manager, nixpkgs, nix-doom-emacs }:
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
            nixpkgs = {
              config = { allowUnfree = true; };
              overlays = [ emacs-overlay.overlay ];
            };
            users.users.nsmith.home = "/Users/nsmith";
            home-manager = {
              useGlobalPkgs = true;
              users.nsmith = {
                imports = [ ./home.nix nix-doom-emacs.hmModule ];
              };
            };
          })
        ];
      };
    };
}
