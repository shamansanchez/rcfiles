call pathogen#infect()

set tabstop=4
set shiftwidth=4
set autoindent
set smartindent
set expandtab
set hlsearch
set bs=2

let g:ctrlp_root_markers = ['vpathlist']
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_show_hidden = 1
let g:ctrlp_open_multiple_files = 'ri'

nnoremap <Up> gk
nnoremap <Down> gj
inoremap <Up> <C-O>gk
inoremap <Down> <C-O>gj

set number

syntax enable

filetype plugin on

ca w!! w !sudo tee "%"

set t_Co=256

let Tlist_File_Fold_Auto_Close = 1

colo wombat256mod

set guifont=Bitstream\ Vera\ Sans\ Mono\ 10
