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
Plugin 'scrooloose/syntastic'
Plugin 'valloric/youcompleteme'


call vundle#end()            " required
filetype plugin indent on    " required

" ***** ***** ***** ***** ***** ***** ***** ***** ***** 

"Show existing tab with 2 spaces width
set tabstop=2
"When indenting with '>', use 2 spaces width
set shiftwidth=2
set tw=80
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
" The / g flag on :%s substitions by default
set gdefault
" Easy and intuitive buffer and split-view navigation
noremap <c-h> <c-w>h
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k 
noremap <c-l> <c-w>l
noremap <Space>v <c-w>v
noremap <Space>h <c-w>s
noremap <Space>q :q<CR>
noremap <Left> gT
noremap <Right> gt
"retain normal paste functionality using control, use non-recursive mapping! 
noremap <c-p> ""p 
" let cuts go to yank register
noremap x "0x
" paste from most recent yank register
noremap p "0p 
noremap P "0P 
" override default L and H methods which I never use
noremap L g_
noremap H ^
" faster, more intuitive redo 
nnoremap U <c-r> 

" Arrow key mapping breaks trackpad scroll
"control-y scrolls up (keeps cursor at present line)
"control-e scrolls down (keeps cursor ...)
"noremap <Up> <c-w> k 
"noremap <Down> <c-w> j 

:imap jj <Esc>
syntax  on
" When .txt or .md file is opened, set automatic text width formatting (even
" in insert mode)
autocmd BufRead,BufNewFile *.txt,*.md setlocal formatoptions+=wa
" Stop comment continuation, See help fo-table for more info 
" using set formatoptions=... doens't work, has to be autocmd, why?
autocmd FileType * set formatoptions=tq
"Automatically loads changes to opened files without alerting
set autoread
"Change the colorscheme so people know you mean business
" colo desert
colo Spacegray " use this for terminal only, use desert for macvim (.gvimrc)
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

" Markdown support + authomatic text width formatting
autocmd BufNewFile,BufRead *.md nnoremap j gj
autocmd BufNewFile,BufRead *.md nnoremap k gk

hi Visual term=reverse ctermfg=251 ctermbg=60 guifg=#D0D0D0 guibg=#5F5F87
" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
" Doesn't ask to save buffer when navigating away (until exit)
set hidden 

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
