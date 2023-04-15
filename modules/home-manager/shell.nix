{
  pkgs,
  lib,
  config,
  ...
}: {
  imports = [
  ];

  options = {};

  config = {
    programs = {
      zsh = {
        enable = true;
        enableCompletion = true;
        enableAutosuggestions = true;
        enableSyntaxHighlighting = true;
        defaultKeymap = "viins";
        history = {
          extended = true;
          ignoreDups = false;
          size = 9999999;
          save = 9999999;
          path = "${config.xdg.stateHome}/zsh_history";
        };
        dotDir = ".config/zsh";
        # dotDir = "${config.xdg.configHome}/zsh";
        completionInit = "
          autoload -Uz compinit
          compinit -d \"${config.xdg.cacheHome}/zsh/zcompdump-\$ZSH_VERSION\"
        ";
      };
      atuin = {
        enable = true;
        enableZshIntegration = true;
      };
      starship = {
        enable = true;
        enableZshIntegration = true;
      };
      zoxide = {
        enable = true;
        enableZshIntegration = true;
      };
      direnv = {
        enable = true;
        nix-direnv.enable = true;
      };
    };
  };
}
