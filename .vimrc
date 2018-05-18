" so % to reload after modifying and saving .vimrc
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim' " required
Plugin 'tpope/vim-fugitive'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Plugin 'scrooloose/syntastic'


call vundle#end()            " required
filetype plugin indent on    " required

" ***** ***** ***** ***** ***** ***** ***** ***** ***** 

"Show existing tab with 2 spaces width
set tabstop=2
"When indenting with '>', use 2 spaces width
set shiftwidth=2
" No splash screen
set shortmess+=I
" In lieu of using :NoMatchParen on every buffer, this will turn off paren highlighting
let g:loaded_matchparen=1
"On pressing tab, insert 2 spaces
set expandtab
set pastetoggle=<f5>
set number
set autoindent
set breakindent
" Easy and intuitive buffer and split-view navigation
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k 
noremap <c-h> gT 
noremap <c-l> gt 
noremap <Left> gT 
noremap <Right> gt 
" paste from most recent yank register
noremap <c-p> "0p 

" Arrow key mapping breaks trackpad scroll
"control-y scrolls up (keeps cursor at present line)
"control-e scrolls down (keeps cursor ...)
"noremap <Up> <c-w> k 
"noremap <Down> <c-w> j 

:imap jj <Esc>
syntax  on
"Keeps new lines tabbed in accordance with parent (useful for .txt, .Rmd files, can specify this in FileType)
"-= disables comment continutation
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
"Automatically loads changes to opened files without alerting
set autoread
"Change the colorscheme so people know you mean business
" colo desert
colo Spacegray " use this for terminal only, use desert for macvim (.gvimrc)
" colo dracula
hi Visual term=reverse ctermfg=251 ctermbg=60 guifg=#D0D0D0 guibg=#5F5F87
" Syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
