{
  config,
  lib,
  inputs,
  options,
  pkgs,
  ...
}: {
  # time.timeZone = "US/Pacific";
  networking.timeServers = options.networking.timeServers.default ++ ["pool.ntp.org"];
  #services.automatic-timezoned.enable = true;
  i18n.defaultLocale = "en_US.UTF-8";
}
