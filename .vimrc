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

set diffopt=context:999999

let g:ctrlp_root_markers = ['vpathlist']
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_show_hidden = 1
let g:ctrlp_open_multiple_files = 'ri'
let g:ctrlp_extensions = ['tag']

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
let g:indent_guides_auto_colors = 0

let g:vdebug_options= {
    \    "port" : 9000,
    \    "server" : 'localhost',
    \    "timeout" : 20,
    \    "on_close" : 'detach',
    \    "break_on_open" : 1,
    \    "ide_key" : '',
    \    "path_maps" : {},
    \    "debug_window_level" : 0,
    \    "debug_file_level" : 0,
    \    "debug_file" : "",
    \    "watch_window_style" : 'expanded',
    \    "marker_default" : '*',
    \    "marker_closed_tree" : '+',
    \    "marker_open_tree" : '-'
    \}

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

" nnoremap <Up> gk
" nnoremap <Down> gj
" inoremap <Up> <C-O>gk
" inoremap <Down> <C-O>gj

" disable arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

nmap <space> zz
nmap n nzz
nmap N Nzz

set number
set mouse=a

syntax enable

filetype plugin on

ca w!! w !sudo tee "%"

set t_Co=256

set laststatus=2

let Tlist_File_Fold_Auto_Close = 1

let g:jellybeans_overrides = {
\ 'Normal': { '256ctermbg': 'NONE' },
\ 'NonText': { '256ctermbg': 'NONE' },
\ }

set termguicolors
let ayucolor="dark"
colo ayu
hi Normal ctermbg=NONE guibg=NONE

set guifont=Terminus\ TTF\ 8
" set guifont=lemon\ 8

highlight ExtraWhitespace ctermbg=196 guibg='red'
match ExtraWhitespace /\s\+$/

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

au FileChangedRO * se noreadonly

au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null

if exists('+colorcolumn')
    set colorcolumn=96
endif

highlight ColorColumn ctermbg=235 guibg='black'

au BufNewFile,BufRead *.raml setlocal ft=yaml

" Transparent editing of gpg encrypted files.
" By Wouter Hanegraaff
augroup encrypted
  au!

  " First make sure nothing is written to ~/.viminfo while editing
  " an encrypted file.
  autocmd BufReadPre,FileReadPre *.gpg set viminfo=
  " We don't want a swap file, as it writes unencrypted data to disk
  autocmd BufReadPre,FileReadPre *.gpg set noswapfile

  " Switch to binary mode to read the encrypted file
  autocmd BufReadPre,FileReadPre *.gpg set bin
  autocmd BufReadPre,FileReadPre *.gpg let ch_save = &ch|set ch=2
  " (If you use tcsh, you may need to alter this line.)
  autocmd BufReadPost,FileReadPost *.gpg '[,']!gpg --decrypt 2> /dev/null

  " Switch to normal mode for editing
  autocmd BufReadPost,FileReadPost *.gpg set nobin
  autocmd BufReadPost,FileReadPost *.gpg let &ch = ch_save|unlet ch_save
  autocmd BufReadPost,FileReadPost *.gpg execute ":doautocmd BufReadPost " . expand("%:r")

  " Convert all text to encrypted text before writing
  " (If you use tcsh, you may need to alter this line.)
  autocmd BufWritePre,FileWritePre *.gpg '[,']!gpg --default-recipient-self -ae 2>/dev/null
  " Undo the encryption so we are back in the normal text, directly
  " after the file has been written.
  autocmd BufWritePost,FileWritePost *.gpg u
augroup END
