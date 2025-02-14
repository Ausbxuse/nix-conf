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
  in {
    templates = import ./templates;

    # ISO
    packages.x86_64-linux = import ./generators {inherit pkgs inputs;};

    nixosConfigurations = {
      timy = mkNixos [./hosts/timy] "timy" "zhenyu";
      uni = mkNixos [./hosts/uni] "uni" "zhenyu";
      spacy = mkNixos [./hosts/spacy] "spacy" "zhenyu";
    };

    homeConfigurations = {
      "zhenyu@timy" = mkHome [./home-manager/timy] pkgs "zhenyu";
      "zhenyu@uni" = mkHome [./home-manager/uni] pkgs "zhenyu";
      "zhenyu@spacy" = mkHome [./home-manager/spacy] pkgs "zhenyu";
      "zhenyu@earthy" = mkHome [./home-manager/earthy] pkgs "zhenyu";
    };
  };
}
