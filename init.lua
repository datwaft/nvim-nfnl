-- [nfnl] Compiled from init.fnl by https://github.com/Olical/nfnl, do not edit.
local plugins_folder = (vim.fn.stdpath("data") .. "/lazy")
local function plugin_path(plugin)
  _G.assert((nil ~= plugin), "Missing argument plugin on /Users/datwaft/.config/nvim-nfnl/init.fnl:5")
  return (plugins_folder .. "/" .. plugin)
end
local function bootstrap(user, plugin, _3fas)
  _G.assert((nil ~= plugin), "Missing argument plugin on /Users/datwaft/.config/nvim-nfnl/init.fnl:9")
  _G.assert((nil ~= user), "Missing argument user on /Users/datwaft/.config/nvim-nfnl/init.fnl:9")
  local plugin_path0 = plugin_path((_3fas or plugin))
  if not vim.loop.fs_stat(plugin_path0) then
    vim.notify(string.format("Bootstrapping %s...", (_3fas or plugin), vim.log.levels.INFO))
    vim.fn.system({"git", "clone", "--filter=blob:none", "--single-branch", string.format("https://github.com/%s/%s.git", user, plugin), plugin_path0})
  else
  end
  return (vim.opt.runtimepath):prepend(plugin_path0)
end
bootstrap("folke", "lazy.nvim")
bootstrap("Olical", "nfnl")
bootstrap("catppuccin", "nvim", "catppuccin")
vim.cmd.colorscheme("catppuccin")
local plugins = {"Olical/nfnl", {"catppuccin/nvim", name = "catppuccin"}}
local lazy = require("lazy")
return lazy.setup(plugins)
