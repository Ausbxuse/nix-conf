{
  inputs = {
    # minegrub-theme.url = "github:Lxtharia/minegrub-theme";
    grub2-theme.url = "github:vinceliuice/grub2-themes";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
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
      specialArgs = specialArgs // {
        hostname = hostname;
      };
      modules = [
        ./hosts/${hostname}/system
        grub2-theme.nixosModules.default
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            extraSpecialArgs = specialArgs;
                #backupFileExtension = "backup";
            useGlobalPkgs = true;
            useUserPackages = true;
            users.${username} = import ./hosts/${hostname}/home;
          };
        }
      ];
    };

    hosts = {
      "${hostname-individual}" = {system = "x86_64-linux"; nixpkgs = nixpkgs-old;};
      "${hostname-universal}" = {system = "x86_64-linux"; nixpkgs = nixpkgs;};
      "${hostname-desktop}" = {system = "x86_64-linux"; nixpkgs = nixpkgs;};
    };

  in {
    nixosConfigurations = builtins.mapAttrs (hostname: params: params.nixpkgs.lib.nixosSystem (configureHost {hostname=hostname; system = params.system;})) hosts;

    homeConfigurations = {
      spacy-tui = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
        extraSpecialArgs = specialArgs // {inherit inputs outputs;};
        modules = [
          ./home/tui
        ];
      };
    };
  };
}
