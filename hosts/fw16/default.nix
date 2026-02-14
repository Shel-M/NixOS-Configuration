{
  config,
  pkgs,
  username,
  lib,
  ...
}: {
  imports = [
    ../../modules/system.nix
    ../../modules/niri.nix

    ./hardware-configuration.nix
  ];
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  boot = {
    kernelParams = ["mem_sleep_default=deep"];
    # Probably wrong - look into kernel resume devices
    # resumeDevice = "/dev/disk/by-uuid/e0250291-e9ec-469c-9ab8-667fc89bc88d";
    # resumeDevice = "/dev/disk/by-uuid/031C5ED7-B026-4993-B4E0-66BA6E0D31BF";
  };

  powerManagement.enable = true;

  services = {
    power-profiles-daemon.enable = true;
    logind.settings.Login = {
      LidSwitch = "suspend-then-hibernate";
      PowerKey = "hibernate";
      PowerKeyLongPress = "poweroff";
    };
  };

  systemd.sleep.extraConfig = ''
    HibernateDelaySec=30m
    SuspendState=mem
  '';

  systemd.services.restart-dpms = {
  #systemd.user.services.restart-dpms = {
    enable = true;
    description = "Restart DPMS on system wake from hibernate";
    after = [ "hibernate.target" "hybrid-sleep.target" "suspend-then-hibernate.target" ];
    wantedBy = [ "hibernate.target" "hybrid-sleep.target" "suspend-then-hibernate.target" ];
    serviceConfig = {
      # ExecStart = ''/etc/nixos/hosts/fw16/scripts/restart-dpms'';
      ExecStart = let 
        SCRIPT = pkgs.writeShellApplication {
          name = "restart-dbms-nix";
          runtimeInputs = [ pkgs.niri ];
          # export NIRI_SOCKET=$(ls /run/user/1000/niri.wayland*)
          text = ''
	    export NIRI_SOCKET
	    NIRI_SOCKET=$(ls /run/user/1000/niri.wayland*)
            niri msg output eDP-1 off
            sleep 1
            niri msg output eDP-1 on
          '';
        }; 
      in 
        lib.getExe SCRIPT;
      #User = "${username}";
    };
  };

  networking.hostName = "fw16";
  networking.networkmanager.enable = true;

  system.stateVersion = "25.11";
}
