{ pkgs, ... }:
{
  # Globally install neovim and dependencies - manage Neovim via default .config/neovim folder
  environment.systemPackages = with pkgs; [
    neovim
    vimPlugins.nvim-treesitter

    (lua5_1.withPackages (
      ps: with ps; [
        busted
        luafilesystem

        # luarocks
        # luajitPackages.jsregexp
      ]
    ))

    tree-sitter
    tree-sitter-grammars.tree-sitter-lua
    tree-sitter-grammars.tree-sitter-rust
    tree-sitter-grammars.tree-sitter-toml
    tree-sitter-grammars.tree-sitter-nix
    #treesitter-cli

    luarocks
    luajitPackages.jsregexp

    clang
    clang-tools

    rust-analyzer

  ];

  # # Add packages to the lua jit interpreter
  # packageOverrides = pkgs: with pkgs; {
  #   myLuaEnv = lua5_1.withPackages (
  #     ps: with ps; [
  #       luajitPackages.jsregexp
  #     ]
  #   );
  # };

}
