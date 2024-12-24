{
  inputs = {
    grub2-theme.url = "github:vinceliuice/grub2-themes";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-6-10.url = "github:NixOS/nixpkgs?rev=617e308893df2bc4455615bdcec4d95cbab49c8c";
    wezterm.url = "github:wez/wezterm?dir=nix";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ags = {
      url = "github:aylur/ags";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    nixpkgs-6-10,
    home-manager,
    ...
  } @ inputs: let
    hostnames = builtins.attrNames (builtins.readDir ./hosts);

    mkHost = {
      hostname,
      system ? "x86_64-linux",
      pkgs ? nixpkgs,
    }: let
      userConfigPath = ./hosts/${hostname}/user.nix;
      homeConfigPath = ./hosts/${hostname}/home;

      userConfig =
        if builtins.pathExists userConfigPath
        then import userConfigPath
        else import ./modules/common/normie/user.nix;
      config = import ./hosts/${hostname}/default.nix;
      homeConfig =
        if builtins.pathExists homeConfigPath
        then import homeConfigPath
        else import ./modules/common/normie/home;
    in {
      system = system;
      nixpkgs = pkgs;

      specialArgs = {
        inherit (userConfig) username user-fullname user-homedir user-email;
        hostname = hostname;
        inherit inputs;
      };

      config = config;
      homeConfig = homeConfig;
    };

    hosts = builtins.listToAttrs (map (hostname: {
        name = hostname;
        value = mkHost {
          hostname = hostname;
          pkgs =
            if hostname == "uni"
            then nixpkgs-6-10
            else nixpkgs;
        };
      })
      hostnames);
  in {
    nixosConfigurations =
      builtins.mapAttrs (
        name: params:
          params.nixpkgs.lib.nixosSystem {
            system = params.system;
            specialArgs = params.specialArgs;
            modules = [
              {nixpkgs.overlays = [(import ./overlays/mutter.nix)];}
              params.config
              inputs.grub2-theme.nixosModules.default
              home-manager.nixosModules.home-manager
              {
                home-manager = {
                  extraSpecialArgs = params.specialArgs;
                  useGlobalPkgs = true;
                  useUserPackages = true;
                  users.${params.specialArgs.username} = params.homeConfig;
                };
              }
            ];
          }
      )
      hosts;

    homeConfigurations = {
      earthy = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.packages.x86_64-linux;
        extraSpecialArgs = {
          username = "earthy";
          user-fullname = "Earthy User";
          user-homedir = "/home/earthy";
          user-email = "earthy@example.com";
          hostname = "earthy-host";
          inherit inputs;
        };
        modules = [
          ./modules/common/minimal/home
        ];
      };
    };
  };
}
