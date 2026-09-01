{
  description = "NixOS config flake";

  inputs = {
    # Repos
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-26.05";

    # Hardware
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    # Partitioning
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    # Secure boot
    lanzaboote = {
      url = "github:nix-community/lanzaboote/v1.1.0";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    # Home dotfiles
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
      lanzaboote,
      home-manager,
      ...
    }@inputs:
    let
      hosts = builtins.attrNames (builtins.readDir ./hosts);
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
              disko.nixosModules.disko
              lanzaboote.nixosModules.lanzaboote
              home-manager.nixosModules.default
              ./hosts/${hostname}
              { networking.hostName = hostname; }
            ];
          };
        }) hosts
      );
    };
}
