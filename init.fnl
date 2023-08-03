;; Where to store plugins
(local plugins-folder (.. (vim.fn.stdpath :data) "/lazy"))

;; Obtain the path to where an specific plugin is stored
(lambda plugin-path [plugin]
  (.. plugins-folder "/" plugin))

;; Add the plugin to the runtimepath and download it if necessary
(lambda bootstrap [user plugin ?alias]
  (local plugin-path (plugin-path (or ?alias plugin)))
  (when (not (vim.loop.fs_stat plugin-path))
    (vim.notify (string.format "Bootstrapping %s..." (or ?alias plugin) vim.log.levels.INFO))
    (vim.fn.system ["git"
                    "clone"
                    "--filter=blob:none"
                    "--single-branch"
                    (string.format "https://github.com/%s/%s.git" user plugin)
                    plugin-path]))
  (vim.opt.runtimepath:prepend plugin-path))

;; Bootstrap essential plugins
(bootstrap "folke" "lazy.nvim")
(bootstrap "Olical" "nfnl")
(bootstrap "catppuccin" "nvim" "catppuccin")
(bootstrap "datwaft" "themis.nvim")

;; Set the colorscheme before loading Lazy
(vim.cmd.colorscheme "catppuccin")

;; Load Lazy
(let [lazy (require :lazy)]
  (lazy.setup "conf.plugins"))
