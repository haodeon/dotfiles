-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

---@class ParserConfig
---@field install_info InstallInfo
---@type table<string, ParserConfig>
local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.unison.install_info.requires_generate_from_grammar = false
parser_config.fsharp = {
  install_info = {
    url = "https://github.com/ionide/tree-sitter-fsharp",
    branch = "main",
    files = { "src/scanner.c", "src/parser.c" },
  },
  requires_generate_from_grammar = false,
  filetype = "fsharp",
}

local wsl_clipboard = {
  cache_enabled = 0,
  copy = {
    ["*"] = "clip.exe",
    ["+"] = "clip.exe",
  },
  name = "WslClipboard",
  paste = {
    ["*"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    ["+"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
  },
}

-- Check the PATH environment variable and set vim.g.clipboard if the condition is met
if string.find(vim.env.PATH, "/mnt/c/Windows/system32") then vim.g.clipboard = wsl_clipboard end

-- Set up custom filetypes
-- vim.filetype.add {
--   extension = {
--     foo = "fooscript",
--   },
--   filename = {
--     ["Foofile"] = "fooscript",
--   },
--   pattern = {
--     ["~/%.config/foo/.*"] = "fooscript",
--   },
-- }
