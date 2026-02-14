{ config, pkgs, ... }:

{
  home.username = "shel";
  home.homeDirectory = "/home/shel";

  xresources.properties = {
    "Xcursor.size" = 16;
    "Xft.dpi" = 189;
  };

  home.packages = with pkgs; [
    fastfetch
    nnn
    
    # archives
    zip
    xz
    unzip
    p7zip

    # networking tools
    
    # misc
    which
    tree
    
    # nix related
    nix-output-monitor # Adds 'nom' command, like 'nix' but with more details

    # utils
    btop
    iotop
    iftop

    # system monitoring
    lsof # list open files

    # system tools
    pciutils # lspci
    usbutils # lsusb
  ];
  
  programs.git = {
    enable = true;
    settings = {
      user.name = "SheldonM";
      user.email = "sheldonjmccullough@gmail.com";
    };
  };

  programs.alacritty = {
    enable = true;
    settings = {
      env.TERM = "xterm-256color";
      font = {
        size = 12;
        # draw_bold_text_with_bright_colors = true;
      };
      scrolling.multiplier = 5;
      selection.save_to_clipboard = true;
    };
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;

    bashrcExtra = ''
      export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"
    '';
  };

  home.stateVersion = "25.11";
}
