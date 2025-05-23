-- This will run last in the setup process.
-- This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

---@class ParserConfig
---@field install_info InstallInfo
---@type table<string, ParserConfig>
local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.unison.install_info.requires_generate_from_grammar = false

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
