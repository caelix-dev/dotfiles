{ pkgs, ... }:
{
  environment.systemPackages = [ pkgs.defaultbrowser ];

  system.activationScripts.postActivation.text = ''
    CONSOLE_USER=$(/usr/bin/stat -f%Su /dev/console)
    sudo -u "$CONSOLE_USER" ${pkgs.defaultbrowser}/bin/defaultbrowser browser 2>/dev/null || true
  '';

  system = {
    defaults = {
      dock = {
        persistent-apps = [
          "/Applications/Arc.app"
          "/Applications/Brave Browser.app"
          "/Applications/Google Chrome.app"
          "/Applications/Safari.app"
          "/System/Applications/Music.app"
          "/Applications/Setapp/Spark Mail.app"
          "/Applications/KakaoTalk.app"
          "/Applications/Vesktop.app"
          "/Applications/Signal.app"
          "/Applications/Telegram.app"
          "/Applications/Zed.app"
          "/Applications/Ghostty.app"
          "/Applications/Setapp/TablePlus.app"
          "/Applications/GitKraken.app"
          "/Applications/Orbstack.app"
          "/Applications/Obsidian.app"
          "/Applications/Setapp.app"
          "/System/Applications/App Store.app"
          "/System/Applications/System Settings.app"
        ];
        tilesize = 54;
        largesize = 80;
        magnification = true;
        autohide = true;
        autohide-delay = 0.0;
      };
      NSGlobalDomain = {
        KeyRepeat = 2;
        InitialKeyRepeat = 15;
        ApplePressAndHoldEnabled = false;
      };
    };
  };
}
