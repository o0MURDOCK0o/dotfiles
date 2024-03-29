{pkgs, ...}: {
  imports = [
  ];

  options = {};

  config = {
    users.defaultUserShell = pkgs.zsh;
    programs.zsh.enable = true;
    environment.systemPackages = with pkgs; [
      alejandra # Formatter for nix
      aria # Basically a better wget
      atuin # Save & search shell history
      bat # Better cat (syntax highlighting, etc.)
      bottom # System monitor
      # cmatrix # A masterhacker essential
      difftastic # Better diff which understands syntax
      # direnv # Automatically load env variables when entering directory
      # dotter # Dotfile management
      # dtrx # Do The Right Extraction
      du-dust # More intuitive du
      duf # Display disk usage stats in a readable way
      # exa # Better ls
      fd # Better find
      # figlet # Almost as important as toilet
      file # Get information about what kind of file you're looking at
      git # I mean it's git
      glow # Render markdown in the terminal
      gnumake # You know make
      helix # Like neovim but less config
      # hyperfine # Benchmark command performance
      # inotify-tools # Watch for file changes
      # jq # Jesus christ it's JSON Bourne
      # just # Like make but easier
      killall # Kill processes by name
      # libqalculate # qalc cli
      # mlocate # Locate files quickly from cached database of files
      # neomutt # TUI email client
      # pfetch # Like neofetch but faster and more minimal
      # pmount # Easier mounting
      progress # Show progress bar for coreutils
      ripgrep # Very fast grep, searches directory recursively by default
      # sd # Move intuitive sed
      # skim # Like fzf, but in rust... yeah that's the only reason
      # sqlite # Sqlite cli
      # starship # Fast af prompt generator with tons of useful info
      taskwarrior # The endboss of task management
      tealdeer # tldr client
      # timewarrior # Companion to taskwarrior which I still have not set up properly
      # tmux # Tabs, panes, sessions, etc.
      # toilet # Almost as important as figlet
      # tokei # Get LOC stats for a directory
      wget # You know this one
      xfce.xfburn # Disc burner for Xfce
      # xplr # TUI file explorer
      zellij # Sort of a little bit like tmux
      zoxide # More modern version of z (remember directories, cd into them without specifying full path)
      zstd # Compression
    ];
  };
}
