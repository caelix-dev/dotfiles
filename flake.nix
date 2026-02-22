{
  description = "Caelix's nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    nix-homebrew.url = "github:zhaofengli/nix-homebrew";
    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };
    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    inputs@{
      self,
      nix-darwin,
      nix-homebrew,
      home-manager,
      homebrew-core,
      homebrew-cask,
      ...
    }:
    {
      darwinConfigurations."caelixui-MacBookPro" = nix-darwin.lib.darwinSystem {
        modules = [
          nix-homebrew.darwinModules.nix-homebrew
          home-manager.darwinModules.home-manager
          ./configurations/default.nix
          ./configurations/darwin.nix
          ./configurations/brew.nix
          ./configurations/home-manager.nix
        ];
        specialArgs = { inherit self homebrew-core homebrew-cask; };
      };
    };
}
