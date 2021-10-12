call plug#begin('~/.local/share/nvim/plugged')
Plug 'JuliaEditorSupport/julia-vim'
Plug 'axelf4/vim-strip-trailing-whitespace'
Plug 'farmergreg/vim-lastplace'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'machakann/vim-highlightedyank'
Plug 'majutsushi/tagbar'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'voldikss/vim-floaterm'
Plug 'jpalardy/vim-slime'
Plug 'lervag/vimtex'
call plug#end()

" Floaterm
nnoremap <silent> <LocalLeader>p :FloatermNew --height=0.4 --width=0.98 --wintype=floating --position=bottom --autoclose=2 --title=ipython ipython <CR>
nnoremap <silent> <LocalLeader>j :FloatermNew --height=0.4 --width=0.98 --wintype=floating --position=bottom --autoclose=2 --title=REPL julia <CR>
nnoremap <silent> <LocalLeader>J :FloatermNew --height=0.98 --width=0.5 --wintype=floating --position=right --autoclose=2 --title=REPL julia <CR>
nnoremap <silent> <LocalLeader>s :FloatermNew --height=0.4 --width=0.98 --wintype=floating --position=bottom --autoclose=2 --title=SHELL <CR>
nnoremap <silent> <LocalLeader>S :FloatermNew --height=1.0 --width=0.5 --wintype=floating --position=right --autoclose=2 --title=SHELL <CR>
nnoremap <silent> <LocalLeader><LocalLeader> :FloatermNext <CR>
nnoremap <silent> <LocalLeader><-> :FloatermToggle <CR>
nnoremap <silent> <CR> :FloatermSend <CR>
vnoremap <silent> <CR> :FloatermSend <CR>
nnoremap <silent> <LocalLeader>q :FloatermKill! <CR>
tnoremap <silent> <LocalLeader>n <C-\><C-n><C-w>

" vim-slime settings
let g:slime_target = "neovim"
tnoremap <Esc> <C-\><C-n>

" markdown settings
let g:vim_markdown_math = 1

" vimtex settings
let g:vimtex_compiler_latexmk = {'build_dir':'./build'}
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
let g:vimtex_view_general_options_latexmk = '--unique'

" general settings
colo onedark
"filetype plugin indent on
filetype indent off
syntax on
set expandtab
set autoindent
set number
set list
set mouse=a
set colorcolumn=121
set cursorline
set termguicolors
set splitright
set diffopt+=vertical
set shortmess=aoOtI
set nostartofline
set nojoinspaces
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType json syntax match Comment +\/\/.\+$+
autocmd FileType julia setlocal spell shiftwidth=4 tabstop=4 softtabstop=4 tw=120 fo=cqt wm=0
autocmd FileType python setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType tex setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType markdown setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2 softtabstop=2
hi Normal ctermbg=NONE ctermbg=NONE
hi Normal guibg=NONE guibg=NONE
hi Trail ctermbg=red ctermbg=red
hi StatusLine guifg=white guibg=#d17402
hi StatusLineNC guifg=grey guibg=darkgrey
call matchadd('Trail', '\s\+$', 100)
au FocusLost * :wa
nnoremap <esc> :noh<return><esc>
set nowrap
set statusline=
set statusline+=%m " edited
set statusline+=\ %f " filename
set statusline+=%*\ %=\ col:%c\ row:%l/%L\ (%02p%%) " col row number percentage
set tw=120

" Nvim
let g:python3_host_prog=expand('~/miniconda3/bin/python')

" trigger `autoread` when files changes on disk
set autoread
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
" notification after file change
autocmd FileChangedShellPost *
\ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
