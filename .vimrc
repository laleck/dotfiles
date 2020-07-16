" so % to reload after modifying and saving .vimrc
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim     "required
call vundle#begin()                   "required
Plugin 'VundleVim/Vundle.vim'         "required
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-commentary'
Plugin 'jez/vim-superman'
Plugin 'valloric/youcompleteme'
Plugin 'lervag/vimtex'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'scrooloose/syntastic'

call vundle#end()            " required
filetype plugin indent on    " required

" ***** ***** ***** ***** ***** ***** ***** ***** ***** 

" Show existing tab with 2 spaces width
set tabstop=2
"When indenting with '>', use 2 spaces width
set shiftwidth=2
set tw=120
" On pressing tab, insert 2 spaces
set expandtab
set autoindent
set breakindent
set pastetoggle=<f5>
" Line numbers
set number
" show previous keystrokes in normal
set showcmd
" show utf-8 code in decimal on statusline
"" set statusline=%b
" show utf-8 code in hex on statusline
" enter utf-8 code by typing ^vu[4 digit hex code]
" can also do ^r^w to insert word at cursor or ^r^a for letter at cursor
" set statusline=%B
" No splash screen
set shortmess+=I
imap jj <Esc>
syntax  on
"Automatically loads changes to opened files without alerting
set autoread
autocmd BufEnter * silent! lcd %:p:h
" Movement by virtual line, not actual
autocmd BufNewFile,BufRead *.md,*.txt nnoremap j gj
autocmd BufNewFile,BufRead *.md,*.txt nnoremap k gk
" In lieu of using :NoMatchParen on every buffer, this will turn off paren highlighting
let g:loaded_matchparen=1
" The / g flag on :%s substitions by default
set gdefault
" Ignore case when searching
set ignorecase
let mapleader=" "
" Easy last yank paste
noremap <Leader>p "0p
nmap <Leader>c <Plug>CommentaryLine
vmap <Leader>k <Plug>Commentary
noremap <Leader>v <c-w>v
noremap <Leader>h <c-w>s
noremap <Leader>q :q<CR>
"Jump to ex mode from normal mode and cycle through previous commands
noremap <c-p> :<c-p>
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
nnoremap L g_
nnoremap H ^
" faster, more intuitive redo 
nnoremap U <c-r> 

" from practical vim, from unimpaired plugin
" intuitive buffer navigation that complies with vim language
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>
" easy go to definition for python
autocmd BufRead,BufNewFile *py nnoremap gd :/def <c-r><c-w><CR>

" if you want to search all buffers, try
" :bufdo! %s/FIND/REPLACE/g
" def function:
"autocmd BufRead,BufNewFile *.py setlocal nnoremap gd 


" From practical vim, navigate command line history with home row while
" retaining filters
cnoremap <c-p> <Up>
cnoremap <c-n> <Down>

" Arrow key mapping breaks trackpad scroll
"control-y scrolls up (keeps cursor at present line)
"control-e scrolls down (keeps cursor ...)
"noremap <Up> <c-w> k 
"noremap <Down> <c-w> j 

" When .txt or .md file is opened, set automatic text width formatting (even
" in insert mode)
set fo -=t
autocmd BufRead,BufNewFile *.txt,*.md setlocal formatoptions+=wa
" Stop comment continuation, See help fo-table for more info 
" using set formatoptions=... doens't work, has to be autocmd, why?
autocmd FileType * set formatoptions=tq
"Change the colorscheme so people know you mean business
colo desert
"colo Spacegray " use this for terminal only, use desert for macvim (.gvimrc)
" to turn on search highlighting
" set hlsearch
" colo dracula
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

" Commands
command! ClearRegs for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor
" Pretty Print JSON, HTML, and XML
command! PPJ %!python -m json.tool
command! PPH !tidy -mi -html -wrap 0 %
command! PPX !tidy -mi -xml -wrap 0 %

" Open current buffer's directory in Finder window
command! CurrentDir !open %:h

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
"
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
" Set statusline=%b (show utf-8 code for value under cursor in normal mode)
