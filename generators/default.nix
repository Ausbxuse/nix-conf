{
  pkgs,
  inputs,
  ...
}: {
  gnome-iso = inputs.nixos-generators.nixosGenerate {
    system = "${pkgs.system}";
    format = "iso";
    customFormats = {iso = import ./formats/gnome-graphical.nix;};
    modules = [
      ../hosts/iso
    ];
  };
}
