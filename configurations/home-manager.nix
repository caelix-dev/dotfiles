{
  system.primaryUser = "caelix";
  users.users.caelix.home = "/Users/caelix";
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "bak";
    users.caelix =
      { pkgs, lib, ... }:
      {
        home.stateVersion = "26.05";

        home.activation.setupNode = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
          # Setup fnm environment (installed via homebrew)
          export PATH="/opt/homebrew/bin:$PATH"
          # Add /usr/bin to PATH
          export PATH="/usr/bin:$PATH"

          # Install/update Node.js LTS and set as default
          /opt/homebrew/bin/fnm install --lts
          /opt/homebrew/bin/fnm default lts-latest

          # Install/update opencode-ai globally using fnm exec
          /opt/homebrew/bin/fnm exec --using=lts-latest -- npm install -g opencode-ai@latest

          # Install/update claude-code globally
          curl -fsSL https://claude.ai/install.sh | bash
        '';
        home.packages = with pkgs; [
          vim
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
            initContent = lib.mkMerge [
              (lib.mkBefore ''
                [[ -f "''${HOME}/Library/Application Support/kiro-cli/shell/zshrc.pre.zsh" ]] && builtin source "''${HOME}/Library/Application Support/kiro-cli/shell/zshrc.pre.zsh"
              '')
              (builtins.readFile ./.zshrc)
              (lib.mkAfter ''
                [[ -f "''${HOME}/Library/Application Support/kiro-cli/shell/zshrc.post.zsh" ]] && builtin source "''${HOME}/Library/Application Support/kiro-cli/shell/zshrc.post.zsh"
              '')
            ];
            envExtra = builtins.readFile ./.zshenv;
          };
          git = {
            enable = true;
            settings = {
              user.email = "me@caelix.dev";
              user.name = "caelix-dev";
            };
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
        };
        home.file = {
          ".config/zed/settings.json".text = builtins.readFile ./zed-settings.json;
          "Library/Application Support/com.mitchellh.ghostty/config".text = builtins.readFile ./ghostty-settings;
          "Library/Application Support/vesktop/settings/settings.json".text = builtins.readFile ./vesktop-settings.json;
        };
      };
  };
}
