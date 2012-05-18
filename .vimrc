call pathogen#infect()

set tabstop=4
set shiftwidth=4
set autoindent
set smartindent
set expandtab
set bs=2

set number

syntax enable

filetype plugin on

ca w!! w !sudo tee "%"

set t_Co=256

let Tlist_File_Fold_Auto_Close = 1

colo wombat256mod

set guifont=Bitstream\ Vera\ Sans\ Mono\ 10
