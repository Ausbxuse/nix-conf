{
  inputs = {
    # minegrub-theme.url = "github:Lxtharia/minegrub-theme";
    grub2-theme.url = "github:vinceliuice/grub2-themes";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    #nixpkgs.url = "github:NixOS/nixpkgs?rev=b8fb460d5b2a6d2efdd40b5c4ec7035f64b89a4a";
    nixpkgs-old.url = "github:NixOS/nixpkgs?rev=e9be42459999a253a9f92559b1f5b72e1b44c13d";

    home-manager = {
      url = "github:nix-community/home-manager";
      # The `follows` keyword in inputs is used for inheritance.
      # Here, `inputs.nixpkgs` of home-manager is kept consistent with
      # the `inputs.nixpkgs` of the current flake,
      # to avoid problems caused by different versions of nixpkgs.
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-old,
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
    }: {
      system = system;
      specialArgs = {
            #  inherit specialArgs;
      inherit username user-fullname user-homedir user-email;
        hostname = hostname;
      };
      modules = [
        ./hosts/${hostname}/system
        grub2-theme.nixosModules.default
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            extraSpecialArgs = {inherit username user-fullname user-homedir user-email;};
                #extraSpecialArgs = specialArgs;
            backupFileExtension = "backup";
            useGlobalPkgs = true;
            useUserPackages = true;
            users.${username} = import ./hosts/${hostname}/home;
          };
        }
      ];
    };
  in {
    nixosConfigurations = {
      # Asus zennbook duo setup
      ${hostname-individual} = nixpkgs-old.lib.nixosSystem (configureHost {
        hostname = "${hostname-individual}";
        system = "x86_64-linux";
      });
      # Universal duo setup
      ${hostname-universal} = nixpkgs.lib.nixosSystem (configureHost {
        hostname = "${hostname-individual}";
        system = "x86_64-linux";
      });
      # Alienware setup
      ${hostname-desktop} = nixpkgs.lib.nixosSystem (configureHost {
        hostname = "${hostname-individual}";
        system = "x86_64-linux";
      });
    };

    homeConfigurations = {
      spacy-tui = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
        extraSpecialArgs = {inherit inputs outputs username user-fullname user-homedir user-email;};
        modules = [
          ./home/tui
        ];
      };
    };
  };
}
