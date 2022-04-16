require "paq" {
    "savq/paq-nvim",
    "navarasu/onedark.nvim",
    {"nvim-treesitter/nvim-treesitter", run=":TSUpdate"},
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
opt.syntax = "off"

-- Treesitter
require'nvim-treesitter.configs'.setup {
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  ignore_install = { }, -- List of parsers to ignore installing
  highlight = {
    enable = { "julia" },              -- false will disable the whole extension
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

-- LaTex
g["vimtex_compiler_latexmk"] = {build_dir="./build"}
g["vimtex_view_general_viewer"] = "okular"
g["vimtex_view_general_options"] = "--unique file:@pdf\\#src:@line@tex"

-- Disabled providers}
g["loaded_python3_provider"] = 0
g["loaded_perl_provider"] = 0
g["loaded_ruby_provider"] = 0
g["loaded_node_provider"] = 0
