{
  pkgs,
  lib,
  config,
  ...
}: {
  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-gtk
      fcitx5-chinese-addons
    ];
  };
  home.activation.installFcitx5 = lib.hm.dag.entryAfter ["writeBoundary"] ''
    ${pkgs.rsync}/bin/rsync -avz --chmod=D2755,F744 ${./fcitx5}/ ${config.home.homeDirectory}/.config/fcitx5/
  '';
}
