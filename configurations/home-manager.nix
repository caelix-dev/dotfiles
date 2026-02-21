{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.caelix =
      { pkgs, ... }:
      {
        home.stateVersion = "unstable";
        home.packages = with pkgs; [
          vim
          git
          eza
          bat
          ripgrep
          dust
          zoxide
          sd
          procs
          gping
          devenv
          nerd-fonts.victor-mono
        ];
        programs = {
          zsh = {
            enable = true;
            shellAliases = {
              ls = "eza";
              cat = "bat";
              grep = "rg";
              du = "dust";
              cd = "z";
              ps = "procs";
              ping = "gping";
            };
            enableCompletion = true;
            autosuggestion.enable = true;
            syntaxHighlighting.enable = true;
            historySubstringSearch.enable = true;
          };
          _1password.enable = true;
          _1password-gui.enable = true;
          git = {
            enable = true;
            email = "me@caelix.dev";
            name = "caelix-dev";
          };
          starship = {
            enable = true;
            enableZshIntegration = true;
            settings = builtins.fromTOML (builtins.readFile ./starship.toml);
          };
          direnv = {
            enable = true;
            enableZshIntegration = true;
            silent = true;
          };
          zed-editor = {
            enable = true;
            settings = builtins.fromJSON (builtins.readFile ./zed-settings.json);
            mutableUserDebug = false;
            mutableUserKeymaps = false;
            mutableUserSettings = false;
            mutableUserTasks = false;
          };
          vesktop = {
            enable = true;
            vencord.settings = builtins.fromJSON (builtins.readFile ./vencord-settings.json);
          };
          ghostty = {
            enable = true;
            enableZshIntegration = true;
            installBatSyntax = true;
            settings = builtins.fromJSON (builtins.readFile ./ghostty-settings.json);
          };
          opencode = {
            enable = true;
          };
        };
      };
  };
}
