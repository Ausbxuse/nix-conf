{
  config,
  lib,
  inputs,
  options,
  pkgs,
  ...
}: {
  imports = [
    ./bootloader.nix
    ./sound.nix
  ];
}
