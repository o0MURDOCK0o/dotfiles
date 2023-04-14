{pkgs, ...}: {
  imports = [
  ];

  options = {};

  config = {
    environment.systemPackages = with pkgs; [element-desktop firefox];
    services.xserver = {
      enable = true;
      desktopManager = {
        xterm.enable = false;
        xfce.enable = true;
      };
      displayManager.defaultSession = "xfce";
      # Temporarily removed awesome to try new things
      # enable = true;

      # displayManager = {
      #   sddm.enable = true;
      #   defaultSession = "none+awesome";
      # };

      # windowManager.awesome = {
      #   enable = true;
      #   luaModules = with pkgs.luaPackages; [
      #     luarocks
      #   ];
      # };
    };
  };
}
