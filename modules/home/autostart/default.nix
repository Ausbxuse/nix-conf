{
  config,
  lib,
  pkgs,
  username,
  ...
}: {
  home.file."${config.xdg.configHome}/autostart/startup.desktop" = {
    text = ''
      [Desktop Entry]
      Type=Application
      Exec=/home/${username}/.local/bin/startup
      Icon=Terminal
      Terminal=false
      Categories=System;TerminalEmulator;

      Name=Startup
      GenericName=Terminal
      Comment=My personal startup script
      StartupWMClass=Startup
      Actions=New;
      X-GNOME-Autostart-enabled=true
      X-Desktop-File-Install-Version=0.26

      [Desktop Action New]
      Name=New Terminal
      Exec=/home/${username}/.local/bin/startup
    '';
    executable = false;
  };
}
