{
  config,
  pkgs,
  ...
}: {
  imports = [
    ../../modules/system.nix

    ./hardware-configuration.nix
  ];

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  networking.hostName = "fw16";

  networking.networkmanager.enable = true;

  system.stateVersion = "25.11";
}
