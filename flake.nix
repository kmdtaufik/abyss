{
  description = "Infinity, NisOS config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    hyprland.url = "github:hyprwm/Hyprland";
    hyprlock = {
      url = "github:hyprwm/hyprlock";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    matugen.url = "github:/InioX/matugen";
    # nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    devsuite.url = "github:kmdtaufik/devsuite";
    nvf.url = "github:notashelf/nvf";
    walker.url = "github:abenz1267/walker";
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      # IMPORTANT: we're using "libgbm" and is only available in unstable so ensure
      # to have it up-to-date or simply don't specify the nixpkgs input
      # inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = inputs @ {
    self,
    nixpkgs,
    home-manager,
    nvf,
    ...
  }: let
    system = "x86_64-linux";
    inherit (import ./settings.nix) username hostname;

    pkgs = import nixpkgs {
      inherit system;
      config = {
        allowUnfree = true;
        android_sdk.accept_license = true;
      };
    };
  in {
    #Exposing packages
    packages."x86_64-linux" = {
      default = self.packages."x86_64-linux".neovim;
      neovim =
        (nvf.lib.neovimConfiguration {
          pkgs = nixpkgs.legacyPackages."x86_64-linux";
          modules = [./modules/pkgs/nvim];
        }).neovim;
    };

    nixosConfigurations = {
      "${hostname}" = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit system;
          inherit inputs;
          inherit username;
          inherit hostname;
        };

        modules = [
          ./system.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.extraSpecialArgs = {
              inherit username;
              inherit inputs;
            };
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              backupFileExtension = ".backup";
              users.${username} = import ./home.nix;
            };
          }
        ];
      };
    };
  };
}
