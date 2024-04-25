{
  inputs.minegrub-theme.url = "github:Lxtharia/minegrub-theme";
  outputs = {nixpkgs, ...} @ inputs: {
    nixosConfigurations.nixuse = nixpkgs.lib.nixosSystem {
      modules = [
        ./configuration.nix
        inputs.minegrub.nixosModules.default
      ];
    };
  };
}
