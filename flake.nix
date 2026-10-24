{
  description = "Abyss, NixOS config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    matugen = {
      url = "github:InioX/matugen";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    devsuite = {
      url = "github:kmdtaufik/devsuite";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      # inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix4adspower = {
      url = "github:kmdtaufik/nix4adspower";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    task-master = {
      url = "github:kmdtaufik/task-master";
    };
    amp = {
      url = "github:kmdtaufik/amp";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    omp = {
      url = "github:kmdtaufik/omp-bin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia/cachix";
    };
    niri = {
      url = "github:epireyn/niri-flake";
    };
  };
  outputs = inputs @ {
    self,
    nixpkgs,
    stylix,
    home-manager,
    ...
  }: let
    inherit (import ./settings.nix) username hostname system;
    /*
      pkgs = import nixpkgs {
      inherit system;
      config = {
        allowUnfree = true;
        android_sdk.accept_license = true;
      };
    };
    */
  in {
    nixosConfigurations = {
      "${hostname}" = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit system;
          inherit inputs;
          inherit username;
          inherit hostname;
        };

        modules = [
          ./system.nix
          inputs.niri.nixosModules.niri
          home-manager.nixosModules.home-manager
          stylix.nixosModules.stylix
          {
            home-manager.extraSpecialArgs = {
              inherit username;
              inherit inputs;
              inherit hostname;
            };
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              backupFileExtension = "backup";
              users.${username} = {
                imports = [
                  (import ./home.nix)
                ];
              };
            };
          }
        ];
      };
    };
  };
}
