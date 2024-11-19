-- Customize Mason plugins

---@type LazySpec
return {
  -- use mason-lspconfig to configure LSP installations
  {
    "williamboman/mason-lspconfig.nvim",
    -- overrides `require("mason-lspconfig").setup(...)`
    opts = {
      ensure_installed = {
        "fsautocomplete",
        "jedi_language_server",
        -- add more arguments for adding more language servers
      },
    },
  },
  -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  {
    "jay-babu/mason-null-ls.nvim",
    -- overrides `require("mason-null-ls").setup(...)`
    opts = {
      ensure_installed = {
        "fantomas",
        -- add more arguments for adding more null-ls sources
      },
      handlers = {
        -- Set the default setup for all sources not explicitly mentioned
        function(source_name, methods) require("mason-null-ls").default_setup(source_name, methods) end,
        -- Disable fantomas
        fantomas = function() end,
      },
    },
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    -- overrides `require("mason-nvim-dap").setup(...)`
    opts = {
      ensure_installed = {
        "codelldb",
        "python",
        -- add more arguments for adding more debuggers
      },
    },
  },
}
