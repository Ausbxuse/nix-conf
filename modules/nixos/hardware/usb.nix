{pkgs, ...}: {
  environment.systemPackages = with pkgs;
    [
      # Hardware
      usbutils
    ]
    ++ [
    ];
}
