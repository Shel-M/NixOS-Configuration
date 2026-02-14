{pkgs, ...}: {
  imports = [ ./thunar.nix ];
  services.displayManager.ly.enable = true;

  programs.niri.enable = true;
  
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  environment.systemPackages = with pkgs; [
    # polkit_gnome
    kdePackages.polkit-kde-agent-1
    kdePackages.partitionmanager
    kdePackages.dolphin
  ];

  security.polkit.enable = true;
}
