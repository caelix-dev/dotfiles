{
  homebrew-core,
  homebrew-cask,
  ...
}:
{
  nix-homebrew = {
    enable = true;
    user = "caelix";
    taps = {
      "homebrew/homebrew-core" = homebrew-core;
      "homebrew/homebrew-cask" = homebrew-cask;
    };
    mutableTaps = false;
  };
  homebrew = {
    enable = true;
    masApps = {
      "Amphetamine" = 937984704;
      "Dropover" = 1355679052;
      "KakaoTalk" = 869223134;
      "RunCat" = 1429033973;
    };
    brews = [
      "fnm"
      "opencode"
    ];
    casks = [
      "1password"
      "antigravity"
      "1password-cli"
      "arc"
      "brave-browser"
      "ghostty"
      "gitkraken"
      "google-chrome"
      "keka"
      "kekaexternalhelper"
      "kiro-cli"
      "nordvpn"
      "obsidian"
      "orbstack"
      "raycast"
      "setapp"
      "signal"
      "telegram"
      "thaw"
      "vesktop"
      "xcodes-app"
      "zed"
    ];
  };
}
