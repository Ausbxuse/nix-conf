{
  inputs = {
    grub2-theme.url = "github:vinceliuice/grub2-themes";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-6-10.url = "github:NixOS/nixpkgs?rev=617e308893df2bc4455615bdcec4d95cbab49c8c";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-6-10,
    home-manager,
    grub2-theme,
    ...
  } @ inputs: let
    inherit (self) outputs;
    username = "zhenyu";
    user-fullname = "Zhenyu Zhao";
    user-homedir = "/home/zhenyu";
    user-email = "peterzhaozzy@gmail.com";
    hostname-individual = "timy";
    hostname-universal = "spacy";
    hostname-desktop = "uni";

    specialArgs = {
      inherit username user-fullname user-homedir user-email;
    };

    configureHost = {
      hostname,
      system,
      config,
      home-config,
    }: {
      system = system;
      specialArgs =
        specialArgs
        // {
          hostname = hostname;
        };
      modules = [
        ./hosts/${hostname}
        grub2-theme.nixosModules.default
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            extraSpecialArgs = specialArgs;
            useGlobalPkgs = true;
            useUserPackages = true;
            users.${username} = import ./hosts/${hostname}/home;
          };
        }
      ];
    };

    hosts = {
      "${hostname-individual}" = {
        system = "x86_64-linux";
        nixpkgs = nixpkgs;
      };
      "${hostname-universal}" = {
        system = "x86_64-linux";
        nixpkgs = nixpkgs;
      };
      "${hostname-desktop}" = {
        system = "x86_64-linux";
        nixpkgs = nixpkgs-6-10;
      };
    };
  in {
    nixosConfigurations = builtins.mapAttrs (hostname: params:
      params.nixpkgs.lib.nixosSystem (configureHost {
        hostname = hostname;
        system = params.system;
      }))
    hosts;

    homeConfigurations = {
      earthy = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
        extraSpecialArgs = specialArgs // {inherit inputs outputs;};
        modules = [
          ./modules/common/user/home.nix
        ];
      };
    };
  };
}
