{ pkgs, lib, ... }:
{
  imports = [
  ];

  options = { };

  config = {
    programs.helix = {
      enable = true;
      settings = {
        theme = "dracula";
        editor = {
          line-number = "relative";
          cursor-shape = {
            insert = "underline";
          };
          whitespace = {
            render = {
              tab = "all";
              newline = "all";
            };
          };
          indent-guides = {
            render = true;
          };
        };
        keys = {
          normal = {
            esc = ["collapse_selection" "keep_primary_selection"];
          };
        };
      };
    };
  };
}
