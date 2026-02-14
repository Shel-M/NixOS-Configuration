{pkgs, self, ...}: {
  environment.systemPackages = [ self.packages.${pkgs.stdenv.system}.neovim ];
}
