{
  pkgs,
  inputs,
  ...
}: {
  gnome-iso = inputs.nixos-generators.nixosGenerate {
    system = "${pkgs.system}";
    format = "iso";
    customFormats = {iso = import ./gnome-graphical.nix;};
    modules = [
      ../hosts/iso
    ];
  };
}
