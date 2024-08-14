{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}: {
  hardware.sensor.iio.enable = true;
}
