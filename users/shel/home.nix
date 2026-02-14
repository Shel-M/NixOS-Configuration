{ inputs, lib, config, pkgs, ... }: {
  imports = [
    #inputs.nvf.homeManagerModules.default
    #./catppuccin.nix

    ../../home/core.nix
    
    ../../home/programs
    ../../home/niri
    # ../../home/themes
  ];

  # nixpkgs = {
  #   overlays = [
  #     inputs.self.overlays.additions
  #     inputs.self.overlays.modifications
  #     inputs.self.overlays.unstable-packages
  #   ];
  #   config.allowUnfree = true;
  # };
  
  programs.git = {
    enable = true;
    settings = {
      user.name = "SheldonM";
      user.email = "sheldonjmccullough@gmail.com";
    };
  };

  #gtk = {
  #  enable = true;

   # cursorTheme.package = pkgs.bibata-cursors;
   # cursorTheme.name = "Bibata-Modern-Ice";

    #iconTheme.package = pkgs.gruvbox-plus-icons;
    #iconTheme.name = "GruvboxPlus";
  #};
  #qt = {
   # enable = true;
   # platformTheme.name = "qtct";
   # style.name = "kvantum";
    #style.package = pkgs.adwaita-qt;
  #};

  #catppuccin = {};
}
