{
  pkgs,
  inputs,
  ...
}: {
  gnome-iso = inputs.nixos-generators.nixosGenerate {
    system = "${pkgs.system}";
    format = "iso";
    customFormats = {iso = import ./formats/minimal-iso.nix;};
    modules = [
      ../hosts/iso
    ];
  };
}
