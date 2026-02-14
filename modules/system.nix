{
  inputs,
  pkgs,
  lib,
  username,
  ...
}: {
  users.users.${username} = {
    isNormalUser = true;
    description = username;
    extraGroups = ["networkmanager" "wheel"];
  };
  nix.settings.trusted-users = [ username ];

  boot.loader.systemd-boot.configurationLimit = 10;

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    auto-optimise-store = true;
  };

  nix.gc = {
    automatic = lib.mkDefault true;
    dates = lib.mkDefault "weekly";
    options = lib.mkDefault "--delete-older-than 7d";
  };

  system.autoUpgrade = {
    enable = true;
    flake = inputs.self.outPath;
    flags = [
      "--update-input"
      "nixpkgs nixpkgs-unstable home-manager"
      "-L"
    ];
  };

  nixpkgs.config.allowUnfree = true;

  time.timeZone = "America/Denver";
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS =  "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  fonts = {
    packages = with pkgs; [
      material-design-icons
      nerd-fonts.symbols-only
      
      noto-fonts

      nerd-fonts.fira-code
      nerd-fonts.jetbrains-mono
      nerd-fonts.iosevka
      nerd-fonts.caskaydia-cove
    ];

    fontconfig.defaultFonts = {
      serif = ["Noto Serif" "Noto Color Emoji"];
      sansSerif = ["Noto Sans" "Noto Color Emoji"];
      monospace = ["JetBrainsMono Nerd Font" "Noto Color Emoji"];
      emoji = ["Noto Color Emoji"];
    };
  };

  programs.dconf.enable = true;

  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall
  # networking.firewall.enable = false;

  # services.openssh = {
  #   enable = true;
  #   settings = {
  #     X11Forwarding = false;
  #     PermitRootLogin = "no";
  #     PasswordAuthentication = false;
  #   };
  #   openFirewall = true;
  # };

  environment.systemPackages = with pkgs; [
    vim
    wget
    curl
    git

    fastfetch
    nnn # terminal file manager
  ];
  
  services.pulseaudio.enable = false;
  services.power-profiles-daemon.enable = true;
  security.polkit.enable = true;

  services = {
    dbus.packages = [pkgs.gcr]; # Todo: look into what this is
    
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      # jack.enable = true; # For JACK applications - commented by default
    };

    udev.packages = with pkgs; [ gnome-settings-daemon ];
  };
}
