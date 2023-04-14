{pkgs, ...}: {
  imports = [
  ];

  options = {};

  config = {
    nixpkgs.config.pulseaudio = true;
    hardware.pulseaudio = {
      enable = true;
      support32Bit = true;
    };
  };
}
