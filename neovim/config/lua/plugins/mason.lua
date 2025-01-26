-- Customize Mason

---@type LazySpec
return {
  -- use mason-tool-installer for automatically installing Mason packages
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    -- overrides `require("mason-tool-installer").setup(...)`
    opts = {
      -- Make sure to use the names found in `:Mason`
      ensure_installed = {
        -- install language servers
        "fsautocomplete",
        "jedi-language-server",

        -- install formatters
        "fantomas",

        -- install debuggers\
        "codelldb",
        "debugpy",

        -- install any other package
      },
    },
  },
  -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  {
    "jay-babu/mason-null-ls.nvim",
    -- overrides `require("mason-null-ls").setup(...)`
    opts = {
      handlers = {
        -- Set the default setup for all sources not explicitly mentioned
        function(source_name, methods) require("mason-null-ls").default_setup(source_name, methods) end,
        -- Disable fantomas
        fantomas = function() end,
      },
    },
  },
}
