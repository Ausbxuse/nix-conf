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
  in {
    # templates = import ./templates;

    nixosConfigurations = {
      timy = mkNixos [./hosts/timy] "timy" "zhenyu";
      uni = mkNixos [./hosts/uni] "uni" "zhenyu";
      spacy = mkNixos [./hosts/spacy] "spacy" "zhenyu";
      # iso = mkNixos [./hosts/iso] "iso" "zhenyu";
    };

    homeConfigurations = {
      "zhenyu@timy" = mkHome [./home-manager/timy] nixpkgs.legacyPackages."x86_64-linux" "zhenyu";
      "zhenyu@uni" = mkHome [./home-manager/uni] nixpkgs.legacyPackages."x86_64-linux" "zhenyu";
      "zhenyu@spacy" = mkHome [./home-manager/spacy] nixpkgs.legacyPackages."x86_64-linux" "zhenyu";
      "zhenyu@earthy" = mkHome [./home-manager/earthy] nixpkgs.legacyPackages."x86_64-linux" "zhenyu";
    };
  };
}
