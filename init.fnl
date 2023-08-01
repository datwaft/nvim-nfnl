;; Where to store plugins
(local plugins-folder (.. (vim.fn.stdpath :data) "/lazy"))

;; Obtain the path to where an specific plugin is stored
(lambda plugin-path [plugin]
  (.. plugins-folder "/" plugin))

;; Add the plugin to the runtimepath and download it if necessary
(lambda bootstrap [user plugin ?as]
  (local plugin-path (plugin-path (or ?as plugin)))
  (when (not (vim.loop.fs_stat plugin-path))
    (vim.notify (string.format "Bootstrapping %s..." (or ?as plugin) vim.log.levels.INFO))
    (vim.fn.system ["git"
                    "clone"
                    "--filter=blob:none"
                    "--single-branch"
                    (string.format "https://github.com/%s/%s.git" user plugin)
                    plugin-path]))
  (vim.opt.runtimepath:prepend plugin-path))

(bootstrap "folke" "lazy.nvim")
(bootstrap "Olical" "nfnl")
(bootstrap "catppuccin" "nvim" "catppuccin")

(vim.cmd.colorscheme "catppuccin")

(local plugins ["Olical/nfnl"
                {1 "catppuccin/nvim"
                 :name "catppuccin"}])

(let [lazy (require :lazy)]
  (lazy.setup plugins))
