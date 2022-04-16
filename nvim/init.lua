require "paq" {
    "savq/paq-nvim",
    "navarasu/onedark.nvim",
    "JuliaEditorSupport/julia-vim",
    "lervag/vimtex",
}

-- Theme
require("onedark").setup {
    style = "dark",
    transparent = true,
}
require("onedark").load()

-- Aliases
local opt = vim.opt
local g = vim.g

-- General
opt.mouse = 'a'
opt.splitright = true
opt.splitbelow = true
opt.relativenumber = true
opt.cursorline = true
opt.tw = 120
opt.cc = "+1"
opt.wrap = false

-- LaTex
g["vimtex_compiler_latexmk"] = {build_dir="./build"}
g["vimtex_view_general_viewer"] = "okular"
g["vimtex_view_general_options"] = "--unique file:@pdf\\#src:@line@tex"
