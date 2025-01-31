{
  pkgs,
  lib,
  config,
  ...
}: {
  i18n.inputMethod = {
    enable = true;
    type = "ibus";
    ibus.engines = with pkgs.ibus-engines; [
      pinyin
    ];
  };
}
