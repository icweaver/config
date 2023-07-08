require "paq" {
    "savq/paq-nvim",
    "navarasu/onedark.nvim",
    {"nvim-treesitter/nvim-treesitter", run=":TSUpdate"},
    "JuliaEditorSupport/julia-vim",
    "ellisonleao/glow.nvim",
}

-- Theme
local theme_style = "deep"
local palette = require("onedark.palette")[theme_style]
require("onedark").setup {
    style = theme_style,
    code_style = {
        comments = "bold,italic",
    },
    transparent = true,
    highlights = {
        ["@comment"] = {fg = palette.fg},
        ["@function.macro"] = {fg = palette.red},
    },
}
require("onedark").load()

-- Aliases
local opt = vim.opt
local g = vim.g
local cmd = vim.cmd
local api = vim.api

-- General
opt.mouse = 'a'
opt.splitright = true
opt.splitbelow = true
opt.number = true
opt.relativenumber = false
opt.cursorline = true
opt.tw = 120
opt.cc = "+1"
opt.wrap = true
opt.syntax = "off"
opt.list = true
opt.expandtab = true
opt.autoindent = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4
opt.title = true
opt.titlestring = [[%f %h%m%r%w]]

-- Commands
-- Remeber last place
cmd[[autocmd BufRead * autocmd FileType <buffer> ++once
\ if &ft !~# 'commit\|rebase' && line("'\"") > 1 && line("'\"") <= line("$") | exe 'normal! g`"' | endif]]
cmd[[autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2]]
cmd[[autocmd FileType json syntax match Comment +\/\/.\+$+]]
cmd[[autocmd FileType julia setlocal spell shiftwidth=4 tabstop=4 softtabstop=4 tw=120 fo=cqt wm=0]]
cmd[[autocmd FileType python setlocal shiftwidth=4 tabstop=4 softtabstop=4]]
cmd[[autocmd FileType tex setlocal shiftwidth=4 tabstop=4 softtabstop=4]]
cmd[[autocmd FileType markdown setlocal shiftwidth=4 tabstop=4 softtabstop=4]]
cmd[[autocmd FileType yaml setlocal shiftwidth=2 tabstop=2 softtabstop=2]]
cmd[[hi MatchParen guibg=none guifg=orange gui=underline]]

-- Mappings
function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

function nmap(shortcut, command)
  map('n', shortcut, command)
end

function imap(shortcut, command)
  map('i', shortcut, command)
end

nmap("<esc>", ":noh<cr><esc>")

-- Treesitter
require'nvim-treesitter.configs'.setup {
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  ignore_install = { }, -- List of parsers to ignore installing
  highlight = {
    enable = { },              -- false will disable the whole extension
    disable = { },  -- list of language that will be disabled
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
  indent = {
    enable = true
  }
}

-- Disabled providers}
g["loaded_python3_provider"] = 0
g["loaded_perl_provider"] = 0
g["loaded_ruby_provider"] = 0
g["loaded_node_provider"] = 0

-- highlight yanked text for 200ms using the "Visual" highlight group
cmd[[
augroup highlight_yank
autocmd!
au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=200})
augroup END
]]

-- autoread
--opt.updatetime = 100
cmd[[au CursorHold * checktime | call feedkeys("lh")]]

-- copy/paste global
api.nvim_set_keymap("", "<leader>y", '"+y', { silent = true })
