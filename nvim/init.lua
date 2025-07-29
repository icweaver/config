require "paq" {
    "savq/paq-nvim",
    {"nvim-treesitter/nvim-treesitter", run=":TSUpdate"},
    "JuliaEditorSupport/julia-vim",
    "ellisonleao/gruvbox.nvim",
    "ellisonleao/glow.nvim",
    "f-person/auto-dark-mode.nvim"
}

-- Aliases
local opt = vim.opt
local g = vim.g
local cmd = vim.cmd
local api = vim.api

require("gruvbox").setup({
  contrast = "hard",
  dim_inactive = true,
  transparent_mode = true,
  palette_overrides = {
      light1 = "#ddcebe"
  }
})

require("auto-dark-mode").setup({
    set_dark_mode = function()
        opt.background = "dark"
    end,
    set_light_mode = function()
        opt.background = "light"
    end,
    update_interval = 2000,
    fallback = "dark"
})

opt.list = true
opt.wrap = false
opt.splitright = true
opt.splitbelow = true
opt.expandtab = true
opt.autoindent = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4
opt.title = true
opt.titlestring = [[%F %h%r%w %m]]

cmd("colo gruvbox")

-- copy/paste global
api.nvim_set_keymap("", "<leader>y", '"+y', { silent = true })
