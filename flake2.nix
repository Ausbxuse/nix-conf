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
    hostnames = builtins.attrNames (builtins.readDir ./hosts);

    mkHost = {
      hostname,
      system ? "x86_64-linux",
      pkgs ? nixpkgs,
    }: let
      userConfig =
        if builtins.pathExists ./hosts/${hostname}/user.nix
        then import ./hosts/${hostname}/user.nix
        else import ./modules/common/normie/user.nix;
    in {
      system = system;
      nixpkgs = pkgs;
      specialArgs = {
        inherit (userConfig) username user-fullname user-homedir user-email;
        hostname = hostname;
      };
      config = import ./hosts/${hostname}/default.nix {
        inherit pkgs;
        inherit (userConfig) username user-fullname user-homedir user-email;
      };
      homeConfig =
        if builtins.pathExists ./hosts/${hostname}/home.nix
        then import ./hosts/${hostname}/home.nix userConfig
        else import ./modules/common/normie/home userConfig;
    };

    configureHost = {
      hostname,
      system,
      config,
      homeConfig,
      specialArgs,
    }:
      nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          config
          grub2-theme.nixosModules.default
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              extraSpecialArgs = specialArgs;
              useGlobalPkgs = true;
              useUserPackages = true;
              users.${specialArgs.username} = homeConfig;
            };
          }
        ];
      };

    # Build a set of hosts from the list of hostnames
    hosts = builtins.listToAttrs (map (h: {
        name = h;
        value = mkHost {
          hostname = h;
          pkgs =
            if h == "uni"
            then nixpkgs-6-10
            else nixpkgs;
        };
      })
      hostnames);
  in {
    nixosConfigurations = builtins.mapAttrs (hostname: params:
      configureHost {
        inherit hostname;
        system = params.system;
        config = params.config;
        homeConfig = params.homeConfig;
      })
    hosts;

    # homeConfigurations = builtins.listToAttrs (map (hostname: {
    #     name = hostname;
    #     value = home-manager.lib.homeManagerConfiguration {
    #       pkgs = nixpkgs.legacyPackages.x86_64-linux; # Adjust as needed
    #       extraSpecialArgs = hosts.${hostname}.specialArgs;
    #       modules = [hosts.${hostname}.homeConfig];
    #     };
    #   })
    #   hostnames);
  };
}
