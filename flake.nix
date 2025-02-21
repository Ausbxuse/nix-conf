{
  inputs = {
    grub2-theme.url = "github:vinceliuice/grub2-themes";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    wallpapers.url = "github:ausbxuse/wallpapers";
    stardict.url = "github:ausbxuse/stardict";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-generators = {
      url = "github:nix-community/nixos-generators";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {nixpkgs, ...} @ inputs: let
    mkNixos = modules: hostname: username:
      nixpkgs.lib.nixosSystem {
        inherit modules;
        specialArgs = {inherit inputs hostname username;};
      };

    mkHome = modules: pkgs: username:
      inputs.home-manager.lib.homeManagerConfiguration {
        inherit modules pkgs;
        extraSpecialArgs = {inherit inputs username;};
      };

    pkgs = nixpkgs.legacyPackages.x86_64-linux;

    user = "zhenyu";
    nixosHosts = ["timy" "uni" "spacy"];
    homeHosts = ["timy" "uni" "spacy" "earthy"];
  in {
    templates = import ./templates;

    packages.x86_64-linux = import ./isos {inherit pkgs inputs;};

    nixosConfigurations = builtins.listToAttrs (map (host: {
        name = host;
        value = mkNixos [./hosts/${host}] host user;
      })
      nixosHosts);

    homeConfigurations = builtins.listToAttrs (map (host: {
        name = "${user}@" + host;
        value = mkHome [./home/${host}] pkgs user;
      })
      homeHosts);
  };
}
