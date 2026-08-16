{
  description = "NixOS config flake";

  inputs = {
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-26.05";

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

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
      disko,
      home-manager,
      ...
    }@inputs:
    let
      hosts = [
        "chris-desktop"
        "chris-laptop"
      ];
      system = "x86_64-linux";
      #pkgs = import nixpkgs-unstable { inherit system; };
      stablePkgs = import nixpkgs-stable { inherit system; };
    in
    {
      nixosConfigurations = builtins.listToAttrs (
        map (hostname: {
          name = hostname;
          value = nixpkgs-unstable.lib.nixosSystem {
            inherit system;
            specialArgs = { inherit inputs stablePkgs; };
            modules = [
              home-manager.nixosModules.default
              ./hosts/${hostname}
            ];
          };
        }) hosts
      );
    };
}
