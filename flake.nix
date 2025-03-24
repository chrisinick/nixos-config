{
  description = "NixOS config flake";

  inputs = {
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
  };

  outputs =
    {
      self,
      nixpkgs-unstable,
      nixpkgs-stable,
      home-manager,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs-unstable { inherit system; };
      stablePkgs = import nixpkgs-stable { inherit system; };
    in
    {
      nixosConfigurations.chris-desktop = nixpkgs-unstable.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs stablePkgs; };
        modules = [
          ./hosts/chris-desktop
          inputs.home-manager.nixosModules.default
        ];
      };

      nixosConfigurations.chris-laptop = nixpkgs-unstable.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs stablePkgs; };
        modules = [
          ./hosts/chris-laptop
          inputs.home-manager.nixosModules.default
        ];
      };
    };
}
