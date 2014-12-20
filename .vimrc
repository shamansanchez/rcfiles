call pathogen#infect()

set tabstop=4
set shiftwidth=4
set autoindent
set smartindent
set expandtab
set hlsearch
set bs=2
set showcmd
set cursorline

let g:ctrlp_root_markers = ['vpathlist']
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_show_hidden = 1
let g:ctrlp_open_multiple_files = 'ri'
let g:ctrlp_extensions = ['tag']

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
let g:indent_guides_auto_colors = 0

" let g:SuperTabDefaultCompletionType = "<C-x><C-o>"

autocmd VimEnter,Colorscheme * : hi IndentGuidesOdd  ctermbg=237
autocmd VimEnter,Colorscheme * : hi IndentGuidesEven ctermbg=237

if has("autocmd")
    " When editing a file, always jump to the last cursor position
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
endif

nnoremap <Up> gk
nnoremap <Down> gj
inoremap <Up> <C-O>gk
inoremap <Down> <C-O>gj

set number
set mouse=a

syntax enable

filetype plugin on

ca w!! w !sudo tee "%"

set t_Co=256

let Tlist_File_Fold_Auto_Close = 1

let base16colorspace=256
" colo wombat256mod
colo spacegray
hi Normal ctermbg=none

set guifont=Bitstream\ Vera\ Sans\ Mono\ 10

highlight ExtraWhitespace ctermbg=196 guibg=196
match ExtraWhitespace /\s\+$/

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

au FileChangedRO * se noreadonly

if exists('+colorcolumn')
    set colorcolumn=96
endif

highlight ColorColumn ctermbg=235 guibg=235
