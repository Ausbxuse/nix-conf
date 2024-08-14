{
  config,
  lib,
  inputs,
  options,
  pkgs,
  ...
}: {
  fonts = {
    fontDir.enable = true;
    packages = with pkgs; [
      #      jetbrains-mono
      noto-fonts-emoji-blob-bin
      source-han-sans
      wqy_zenhei # Need by steam for Chinese
    ];
  };
}
