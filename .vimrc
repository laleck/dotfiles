" so % to reload after modifying and saving .vimrc
set nocompatible              " be iMproved, required
filetype off                  " required

" Add home directory to path for use with :find
set path+=~/Desktop/**
set path+=~/Documents/**
set path+=~/Downloads/**
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim     "required
call vundle#begin()                   "required
Plugin 'VundleVim/Vundle.vim'         "required
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
" Use '.' character to repeat surround commands
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-commentary'
" insert-mode caps lock: ctrl-gc 
" gC in normal mode for true caps lock
Plugin 'tpope/vim-capslock'
Plugin 'plasticboy/vim-markdown'
" writing markdown file refreshes browser/preview view
Plugin 'JamshedVesuna/vim-markdown-preview'
Plugin 'jez/vim-superman'
Plugin 'valloric/youcompleteme'
Plugin 'lervag/vimtex'
Plugin 'mogelbrod/vim-jsonpath'
Plugin 'salsifis/vim-transpose'
" TODO use fzf instead
Plugin 'kien/ctrlp.vim'
" Plugin 'scrooloose/syntastic'

call vundle#end()            " required
filetype plugin indent on    " required
" Plugin settings
let g:tex_flavor = 'latex'
" On write, update browser/preview
let vim_markdown_preview_hotkey='<Leader>p'
let vim_markdown_preview_toggle=1
let vim_markdown_preview_github=1
" ***** ***** ***** ***** ***** ***** ***** ***** ***** 

" Show existing tab with 2 spaces width
set tabstop=2
"When indenting with '>', use 2 spaces width
set shiftwidth=2
set tw=120
set expandtab
set autoindent
set breakindent
set pastetoggle=<f5>
set number
" show command building keystrokes in normal mode
set showcmd
" show utf-8 code in decimal on statusline
"" set statusline=%b
" show utf-8 code in hex on statusline
" enter utf-8 code by typing ^vu[4 digit hex code]
" set statusline=%B
" No splash screen
set shortmess+=I
imap jj <Esc>
syntax  on
"Automatically loads changes to opened files without alerting
set autoread
" TODO 
" autocmd BufEnter * silent! lcd %:p:h
" Use %% as macro for current buffer's directory from Practical Vim
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
" Movement by virtual line, not actual
" autocmd BufNewFile,BufRead *.md,*.txt nnoremap j gj
" autocmd BufNewFile,BufRead *.md,*.txt nnoremap k gk
" autocmd BufEnter *.md,*.txt set spell
" In lieu of using :NoMatchParen on every buffer, this will turn off paren highlighting
let g:loaded_matchparen=1
" The / g flag on :%s substitions by default
set gdefault
" Ignore case when searching
set ignorecase
let mapleader=" "
" Easy last yank paste
noremap <Leader>p "0p
" Go to alternate (last) buffer with backspace
nnoremap <BS> <C-^>
" nmap <Leader>c <Plug>CommentaryLine
" vmap <Leader>k <Plug>Commentary
noremap <Leader>v <c-w>v
noremap <Leader>h <c-w>s
noremap <Leader>q :q<CR>
" Quick buffer switching
nnoremap <Leader>b :ls<CR>:b<Space>
"Jump to ex mode from normal mode and cycle through previous commands
" noremap <c-p> :<c-p>
" Easy and intuitive buffer and split-view navigation
noremap <c-h> <c-w>h
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k 
noremap <c-l> <c-w>l
" Arrow keys in normal mode to switch tabs
noremap <Left> gT
noremap <Right> gt
" retain normal paste functionality using control, use non-recursive mapping! 
" use this when trying to paste from other registers
" noremap <c-p> ""p 
" let cuts go to yank register
" noremap x "0x
" paste from most recent yank register
" noremap p "0p 
" noremap P "0P 
" override default L and H methods which I never use
" go to first/last character of line
noremap H ^
noremap L g_
noremap gH g^
"noremap" gL g$

" from practical vim
" use c-l to navigate instead
" nnoremap <silent> <c-l> :<C-u>nohlsearch<CR><c-l>

" from practical vim, from unimpaired plugin
" intuitive buffer navigation that complies with vim language
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

" Recommended by practical vim, get filtering that arrow keys offer
cnoremap <C-p> <Up>
cnoremap <C-j> <Down>

" if you want to search all buffers, try
" :bufdo! %s/FIND/REPLACE/g
" def function:
"autocmd BufRead,BufNewFile *.py setlocal nnoremap gd 


" From practical vim, navigate command line history with home row while
" retaining filters
cnoremap <c-p> <Up>
cnoremap <c-n> <Down>

" When .txt or .md file is opened, set automatic text width formatting (even
" in insert mode)
" autocmd BufRead,BufNewFile *.txt,*.md setlocal formatoptions+=wa
" Stop comment continuation, See help fo-table for more info 
" using set formatoptions=... doens't work, has to be autocmd, why?
set formatoptions=tq
"autocmd FileType * set formatoptions=tcq
colo desert
" to turn off search highlighting
set nohlsearch
" Ignore files that vim doesn't use
set wildignore+=.git,.hg,.svn
set wildignore+=.steam,.cache
set wildignore+=*.aux,*.out,*.toc
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest,*.rbc,*.class
set wildignore+=*.ai,*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png,*.psd,*.webp
set wildignore+=*.avi,*.divx,*.mp4,*.webm,*.mov,*.m2ts,*.mkv,*.vob,*.mpg,*.mpeg
set wildignore+=*.mp3,*.oga,*.ogg,*.wav,*.flac
set wildignore+=*.eot,*.otf,*.ttf,*.woff
set wildignore+=*.doc,*.pdf,*.cbr,*.cbz
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz,*.kgb
set wildignore+=*.swp,.lock,.DS_Store,._*

" Netrw
" For netrw mappings: :h netrw-quickmap
" Use o to open dir in new split
" ctrl-l to refresh dir
noremap <c-n> :Lex!<CR>
let g:netrw_winsize = 25
let g:netrw_banner = 0
let g:netrw_liststyle = 3
" let g:netrw_usetab = 1 " enables c-tab to turn on Lex

" Commands
command! ClearRegs for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor
" Pretty Print JSON, HTML, and XML
command! PPJ %!python -m json.tool
command! PPH !tidy -mi -html -wrap 0 %
command! PPX !tidy -mi -xml -wrap 0 %

" Open current buffer's directory in Finder window
command! CurrentDir silent !open %:h

" Navigate visual lines instead of actual lines
autocmd BufNewFile,BufRead *.md,*.txt nnoremap j gj
autocmd BufNewFile,BufRead *.md,*.txt nnoremap k gk

hi Visual term=reverse ctermfg=251 ctermbg=60 guifg=#D0D0D0 guibg=#5F5F87
"" Syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
" Doesn't ask to save buffer when navigating away (until exit)
set hidden 
