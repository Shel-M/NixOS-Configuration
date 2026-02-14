{ pkgs, lib, ... }: {
  vim = {
    theme = {
      enable = true;
      name = "catppuccin";
      style = "mocha";
      #extraConfig = ''
      #  require("catppuccin").setup({
      #    color_overrides = { mocha = { base = "#000000" }}
      #  })
      #'';
    };

    statusline.lualine.enable = true;
    telescope.enable = true;
    autocomplete.nvim-cmp.enable = true;
    lsp.enable = true;

    languages = {
      enableTreesitter = true;

      nix.enable = true;
      rust.enable = true;
    };
  };
}
