{ inputs, lib, config, pkgs, ... }: {
  imports = [
    #../../modules/neovim
    ./stylix.nix

    ./neovim.nix
  ];

  nixpkgs = {
    overlays = [
      inputs.self.overlays.additions
      inputs.self.overlays.modifications
      inputs.self.overlays.unstable-packages
      # inputs.nix-neovim.overlays.default
    ];
    config.allowUnfree = true;
  };

  users.users.shel = {
    # openssh.authorizedKeys.keys = [];
  };

  users.extraUsers.shel = {
    shell = pkgs.fish;
  };

  programs.bash.enable = true;
  programs.fish.enable = true;
  documentation.man.generateCaches = false; # Makes builds slow with fish

  # environment.systemPackages = with pkgs; [
  #   nvim-pkg
  # ];

  #catppuccin = {
  #  gtk = {
  #    icon.enable = true;
  #    icon.accent = "mauve";
  #    icon.flavor = "mocha";
  #  };
  #};
}
