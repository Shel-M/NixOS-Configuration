{
  pkgs,
  #config,
  #username,
  ...
}: {
  programs.pyenv.enable = true;
  programs.zoxide.enable = true;

  programs.fish = {
    enable = true;
    functions = {
      boot-uefi = "systemctl reboot --firmware-setup";
      sudonvim = "sudo -E -s nvim $argv";
      restart-dpms = "niri msg output eDP-1 off && sleep 2 && niri msg output eDP-1 on";
    };
    # ${builtins.readFile ./static/variables.fish}
    interactiveShellInit = ''
      ${builtins.readFile ./static/config.fish}
    '';
  };

  programs.man.generateCaches = false; # Makes nix builds slow

  #''
  #  function sudonvim --wraps="sudo -E -s nvim" --description "alias sudonvim=sudo -E -s nvim"
  #    sudo -E -s nvim $argv
  #  end
  #'';

  #xdg.configFile."fish/config.fish" = { source = ./static; recursive = true; };
}
