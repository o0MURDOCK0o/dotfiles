# Add your reusable home-manager modules to this directory, on their own file (https://nixos.wiki/wiki/Module).
# These should be stuff you would like to share with others, not your personal configurations.
{
  shell = import ./shell.nix;
  helix = import ./helix.nix;
  # List your module files here
  # my-module = import ./my-module.nix;
}
