-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "lua",
      "nix",
      "python",
      "rust",
      "toml",
      "unison",
      "yaml",
      -- add more arguments for adding more treesitter parsers
    },
  },
}
