{ pkgs, ... }:
{
  environment.systemPackages = [ pkgs.defaultbrowser ];

  system.keyboard = {
    enableKeyMapping = true;
    userKeyMapping = [
      {
        HIDKeyboardModifierMappingSrc = 30064771129; # CapsLock
        HIDKeyboardModifierMappingDst = 30064771181; # F18
      }
    ];
  };

  system.activationScripts.postActivation.text = ''
    CONSOLE_USER=$(/usr/bin/stat -f%Su /dev/console)
    sudo -u "$CONSOLE_USER" ${pkgs.defaultbrowser}/bin/defaultbrowser browser 2>/dev/null || true

    PLIST="/Users/$CONSOLE_USER/Library/Preferences/com.apple.symbolichotkeys.plist"

    # F18(79)을 입력소스 전환 단축키로 설정 (key 61 = Select next input source)
    sudo -u "$CONSOLE_USER" /usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:61:enabled bool true"          "$PLIST" 2>/dev/null || true
    sudo -u "$CONSOLE_USER" /usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:61:value:parameters:0 integer 65535" "$PLIST" 2>/dev/null || true
    sudo -u "$CONSOLE_USER" /usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:61:value:parameters:1 integer 79"    "$PLIST" 2>/dev/null || true
    sudo -u "$CONSOLE_USER" /usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:61:value:parameters:2 integer 0"     "$PLIST" 2>/dev/null || true

    # Cmd+Space Spotlight 비활성화 (key 64)
    sudo -u "$CONSOLE_USER" /usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:64:enabled bool false" "$PLIST" 2>/dev/null || true

    sudo -u "$CONSOLE_USER" /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u 2>/dev/null || true
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
        mru-spaces = false;
      };
      NSGlobalDomain = {
        KeyRepeat = 2;
        InitialKeyRepeat = 15;
        ApplePressAndHoldEnabled = false;
      };
    };
  };
}
