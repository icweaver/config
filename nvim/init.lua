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

-- Mappings
function map(mode, shortcut, command)
  api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

function nmap(shortcut, command)
  map('n', shortcut, command)
end

function imap(shortcut, command)
  map('i', shortcut, command)
end

nmap("<esc>", ":noh<cr><esc>")

require("gruvbox").setup({
  contrast = "hard",
  dim_inactive = true,
  transparent_mode = true,
  palette_overrides = {
      light1 = "#ddcebe",
      fg4 = "#000000",
  },
  overrides = {
      StatusLineNC = {bg = "#e3dbd3"},
      Whitespace = { fg = 'white', bg = 'red', bold = true },
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

opt.autoread = true
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
opt.clipboard = "unnamedplus"

cmd("colo gruvbox")

-- highlight extra whitespace when leaving insert mode
local whitespace_hl = { fg = 'white', bg = 'red', bold = true }
api.nvim_create_autocmd("InsertLeave", {
  callback = function() api.nvim_set_hl(0, 'Whitespace', whitespace_hl) end,
})
api.nvim_create_autocmd("InsertEnter", {
  callback = function() api.nvim_set_hl(0, 'Whitespace', {}) end,
})

-- Autoread
api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
  command = "if mode() != 'c' | checktime | endif",
  pattern = { "*" },
})

-- Spellcheck
api.nvim_set_hl(0, 'SpellBad', { bg = 'red', fg = 'white', bold = true })
