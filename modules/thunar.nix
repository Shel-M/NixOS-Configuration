{pkgs, ...}: {
  programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce; [ thunar-archive-plugin thunar-volman ];
  };

  # Thunar-related services
  services.gvfs.enable = true; # Mount, trash, etc.
  services.tumbler.enable = true; # Thumbnail support for images
  
}
