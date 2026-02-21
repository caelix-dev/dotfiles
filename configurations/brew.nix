{
  homebrew-core,
  homebrew-cask,
  ...
}:
{
  nix-homebrew = {
    enable = true;
    enableRosetta = true;
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
    formula = [
      "xcodes"
    ];
    casks = [
      "arc"
      "brave-browser"
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
    ];
  };
}
