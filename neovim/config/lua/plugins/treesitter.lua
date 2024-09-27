-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      -- "fsharp",
      "lua",
      "nix",
      "powershell",
      "python",
      "rust",
      "toml",
      "unison",
      "yaml",
      -- add more arguments for adding more treesitter parsers
    },
  },
}
