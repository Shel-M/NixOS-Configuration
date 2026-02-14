{
  pkgs,
  config,
  ...
}: {
  home.file.".config/niri/config.kdl".source = ./config.kdl;

  #xresources.properties = {
  #  "Xcursor.size" = 24;
  #  "Xft.dpi" = 189;
  #};

  programs.alacritty.enable = true; # Super+T in the default setting (terminal)
  programs.fuzzel.enable = true; # Super+D in the default setting (app launcher)
  programs.swaylock.enable = true; # Super+Alt+L in the default setting (screen locker)
  programs.waybar.enable = true; # launch on startup in the default setting (bar)

  services.mako.enable = true; # notification daemon
  services.swayidle.enable = true; # idle management daemon
  services.polkit-gnome.enable = true; # polkit

  
  home.packages = with pkgs; [
    swaybg # wallpaper

    kdePackages.partitionmanager
  ];

  xdg.portal.configPackages = with pkgs; [xdg-desktop-portal-gnome xdg-desktop-portal-gtk];

  # Can change this once we have waybar styled
  # catppuccin.waybar = {
  #   enable = false;
  # };
}
