{
  pkgs,
  config,
  inputs,
  ...
}:
{
  #imports = [ inputs.nvf.homeManagerModules.default ];
  # home.packages = [ pkgs.neovim ];

  # programs.neovim = {
  #   enable = false;
  #
  #   viAlias = true;
  #   vimAlias = true;
  #   vimdiffAlias = true;
  #   defaultEditor = true;
  #
  #   extraPackages = with pkgs; [
  #     # Language servers
  #     lua-language-server
  #     rust-analyzer
  #     nixd # Nix
  #
  #     # Compilers
  #     clang
  #   ];
  #
  #   extraLuaConfig = ''
  #     	  ${builtins.readFile ./lua/options.lua}
  #     	  ${builtins.readFile ./lua/commands.lua}
  #     	'';
  #
  #   plugins = with pkgs.vimPlugins; [
  #     nvim-treesitter
  #     nvim-treesitter.withAllGrammars
  #     nvim-treesitter-textobjects
  #
  #     vim-fugitive
  #   ];
  # };

  # environment.variables.EDITOR = "nvim";
}
