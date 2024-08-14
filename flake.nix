{
  inputs = {
    # minegrub-theme.url = "github:Lxtharia/minegrub-theme";
    grub2-theme.url = "github:vinceliuice/grub2-themes";
    #nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    #nixpkgs.url = "github:NixOS/nixpkgs?rev=b8fb460d5b2a6d2efdd40b5c4ec7035f64b89a4a";
    nixpkgs.url = "github:NixOS/nixpkgs?rev=e9be42459999a253a9f92559b1f5b72e1b44c13d";

    #nixpkgs = import (builtins.fetchGit {
    #  # Descriptive name to make the store path easier to identify
    #  name = "my-old-revision";
    #  url = "https://github.com/NixOS/nixpkgs/";
    #  ref = "refs/heads/nixpkgs-unstable";
    #  rev = "0c19708cf035f50d28eb4b2b8e7a79d4dc52f6bb";
    #}) {};
    # mypkgs = import (builtins.fetchTarball {
    #   url = "https://github.com/NixOS/nixpkgs/archive/0c19708cf035f50d28eb4b2b8e7a79d4dc52f6bb.tar.gz"; # 46.1
    #   #url="https://github.com/NixOS/nixpkgs/archive/67b4bf1df4ae54d6866d78ccbd1ac7e8a8db8b73.tar.gz"; # 46.2
    #   sha256 = "0ngw2shvl24swam5pzhcs9hvbwrgzsbcdlhpvzqc7nfk8lc28sp3";
    # }) {system = "x86_64-linux";};

    #nixpkgs.url = "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/nixpkgs-unstable/nixexprs.tar.xz";
    #home-manager.url = "github:nix-community/home-manager";
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
  in {
    nixosConfigurations = {
      myiso = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ({
            pkgs,
            modulesPath,
            lib,
            ...
          }: {
            imports = [(modulesPath + "/installer/cd-dvd/installation-cd-minimal.nix")];

            boot.kernelPackages = pkgs.linuxPackages_latest;

            # Needed for https://github.com/NixOS/nixpkgs/issues/58959
            boot.supportedFilesystems = lib.mkForce [ "btrfs" "reiserfs" "vfat" "f2fs" "xfs" "ntfs" "cifs" ];

            # faster build time
            isoImage.squashfsCompression = "gzip -Xcompression-level 1";

            environment.systemPackages = with pkgs; [
              tmux
              git
              just
              rsync
            ];
          })
        ];
      };
      # Asus zennbook duo setup
      ${hostname-individual} = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          inherit username user-fullname user-homedir user-email;
          hostname = hostname-individual;
        };
        modules = [
          ./hosts/timy/system
          grub2-theme.nixosModules.default
          home-manager.nixosModules.home-manager
          {
            home-manager.extraSpecialArgs = {
              inherit username user-fullname user-homedir user-email;
            };
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.${username} = import ./hosts/timy/home;
          }
        ];
      };

      # Universal setup
      ${hostname-universal} = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          inherit username user-fullname user-homedir user-email;
          hostname = hostname-universal;
        };
        modules = [
          ./hosts/spacy/system
          grub2-theme.nixosModules.default
          home-manager.nixosModules.home-manager
          {
            home-manager.extraSpecialArgs = {
              inherit username user-fullname user-homedir user-email;
            };
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.${username} = import ./hosts/spacy/home;
          }
        ];
      };
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
