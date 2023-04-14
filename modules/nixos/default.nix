# Add your reusable NixOS modules to this directory, on their own file (https://nixos.wiki/wiki/Module).
# These should be stuff you would like to share with others, not your personal configurations.

{
  # List your module files here
  # my-module = import ./my-module.nix;
  security = import ./security.nix;
  desktop = import ./desktop.nix;
  audio = import ./audio.nix;
  shell = import ./shell.nix;
}
