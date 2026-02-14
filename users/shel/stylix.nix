{ pkgs, username, ... }:
{
  stylix = {
    enable = true;

    base16Scheme = import ./themes/catppuccin-mocha-oled.nix;

    polarity = "dark";
    image = ./wallpapers/clarity.png;

    cursor = {
      package = pkgs.catppuccin-cursors;
      name = "catppuccin-cursors-mochaMauve";
      size = 24;
    };

    fonts = {
      serif = {
        package = pkgs.nerd-fonts.iosevka-term-slab;
        name = "IosevkaTermSlab Nerd Font";
      };
      sansSerif.name = "Caskaydia Cove Nerd Font";
      monospace.name = "Caskaydia Cove Nerd Font Mono";
      emoji = {
        package = pkgs.noto-fonts-color-emoji;
        name = "Noto Color Emoji";
      };
    };
  };
}
