let mapleader=" " "this should be asssigned before it's referenced
" set nocompatible              " guess this is no longer required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim     
call vundle#begin()                   
Plugin 'VundleVim/Vundle.vim'         
"" Git
" gitgutter shows changes since revision but can add lots of lag
" Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
"" Navigation
Plugin 'tpope/vim-vinegar'
Plugin 'tpope/vim-unimpaired'
Plugin 'kien/ctrlp.vim'
"" Text editing
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-commentary'
" insert-mode caps lock: ctrl-gc gC in normal mode for true caps lock
" Plugin 'tpope/vim-capslock'
" [In/De]rement dates with ctrl-[a/x]
Plugin  'tpope/vim-speeddating'
" Plugin 'jez/vim-superman'
Plugin 'valloric/youcompleteme'
" :JsonPython echoes the path under cursor
" Plugin 'mogelbrod/vim-jsonpath'
"" Markdown
" Plugin 'plasticboy/vim-markdown'
" Plugin 'JamshedVesuna/vim-markdown-preview'
"" Additonal Functionality
Plugin 'nathangrigg/vim-beancount'
Plugin 'salsifis/vim-transpose'
" for summing columns of numbers <leader>ma
Plugin 'EvanQuan/vmath-plus'
Plugin 'vim-airline/vim-airline'
Plugin 'nelstrom/vim-visual-star-search'
"" Language support
" Plugin 'scrooloose/syntastic'
" Plugin 'lervag/vimtex'

call vundle#end()            " required
filetype plugin indent on    " required

" vmath settings -- warning overwrites a couple of registers
nmap <leader>ma <Plug>(vmath_plus#normal_analyze)
nmap <leader>mba <Plug>(vmath_plus#normal_analyze_buffer)
xmap <leader>ma <Plug>(vmath_plus#visual_analyze)
xmap <leader>mba <Plug>(vmath_plus#visual_analyze_buffer)
nmap <leader>mr <Plug>(vmath_plus#report)
nmap <leader>mbr <Plug>(vmath_plus#report_buffer)

let g:tex_flavor = 'latex'
" On write, update browser/preview
let vim_markdown_preview_hotkey='<Leader>mp'
let vim_markdown_preview_toggle=1
let vim_markdown_preview_github=1

let g:netrw_winsize = 25
let g:netrw_banner = 0
let g:netrw_liststyle = 4 "3 for tree view, use i to cycle
" let g:netrw_list_hide = '^\.[^\.].*' "hide everything starting with dot (except for previous dir) use 'a' to toggle hide/show
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
let g:netrw_hide = 1 " hide list_hide by default

let g:ctrlp_working_path_mode = 'rc'
" Quick buffer switching
nnoremap <Leader><Leader>b :ls<CR>:b
nnoremap <Leader>b :CtrlPBuffer<CR>

let g:ctrlp_buffer_func = { 'enter': 'MyCtrlPMappings' }
func! MyCtrlPMappings()
    nnoremap <buffer> <silent> <c-@> :call <sid>DeleteBuffer()<cr>
endfunc

func! s:DeleteBuffer()
    let line = getline('.')
    let bufid = line =~ '\[\d\+\*No Name\]$' ? str2nr(matchstr(line, '\d\+'))
        \ : fnamemodify(line[2:], ':p')
    exec "bd" bufid
    exec "norm \<F5>"
endfunc

" amount of time between swp writes. useful for gitgutter (default 4000)
set updatetime=100
" ***** ***** ***** ***** ***** ***** ***** ***** ***** 

set tw=120
" note tab settings are overridden when dealing with python files
set expandtab " tab will insert n amount of spaces instead, see softtabstop
set tabstop=8 " number of spaces a tab counts for, my files rarely have actual tabs
set softtabstop=2 " how many spaces a tab press inserts
set shiftwidth=2 " indentation by 2 spaces
set autoindent
set breakindent
set pastetoggle=<f5>
set number
" Doesn't ask to save buffer when navigating away (until exit)
set hidden 
syntax  on
set autoread
set shortmess+=I
imap jj <Esc>
" show command building keystrokes in normal mode
set showcmd
" The / g flag on :%s substitions by default
set gdefault
" Ignore case when searching
set ignorecase
" set foldmethod=syntax
set formatoptions=tcqj
" to turn off search highlighting
set nohlsearch
colo dracula

" View nonbreaking whitespace
" set lcs=tab:╋━,trail:·,nbsp:␣
" set list

" show utf-8 code in decimal on statusline
" set statusline=%b
" show utf-8 code in hex on statusline
" enter utf-8 code by typing ^vu[4 digit hex code]
" set statusline=%B
"Automatically loads changes to opened files without alerting
" TODO 
" autocmd BufEnter * silent! lcd %:p:h
" Use %% as macro for current buffer's directory from Practical Vim
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
" cabbr <expr> %% expand('%:p:h')
" In lieu of using :NoMatchParen on every buffer, this will turn off paren highlighting
let g:loaded_matchparen=1

" " insert highlighted text into ex mode
" vnoremap <Leader>: y:<C-r>"<C-b>

" paste with last yanked register ("0)
noremap <Leader>p "0p
noremap <Leader>P "0P
" paste over currently selected text without yanking deleted text
xnoremap p pgvy
xnoremap P Pgvy

" Recalculate shortcut, use in beancount
vnoremap <Leader>x xi<C-r>=<C-r>"
"yank highlighted text to m (math) register, find '=', delete WORD, insert calculation result
vnoremap <Leader>= "myA = <C-r>=<C-r>m<CR>

" These are to cancel the default behavior of d, D, c, C to put the text they delete in the default register. 
nnoremap d "_d
vnoremap d "_d
nnoremap D "_D
vnoremap D "_D
nnoremap c "_c
vnoremap c "_c
nnoremap C "_C
vnoremap C "_C

" Go to alternate (last) buffer with backspace
nnoremap <BS> <c-^>
noremap <Leader>v <c-w>v
noremap <Leader>h <c-w>s
noremap <Leader>q :q<CR>
" nnoremap <Leader>b :ls<CR>:b
"Jump to ex mode from normal mode and cycle through previous commands
" noremap <c-p> :<c-p>
" Easy and intuitive buffer and split-view navigation
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
" Arrow keys to always navigate by visible line
nnoremap <Up> gk
nnoremap <Down> gj
" noremap <Left> h
" noremap <Right> l

"vnoremap <Right> zf
" normal and visual modes. remember: {visual}zf
noremap <Leader>f zfzc
vnoremap <Left> zfzc
nnoremap <Left> zc
nnoremap <Right> zo

noremap <S-Tab> zc
" noremap <Tab> zo "don't use this, kills <c-i>
" highlight FoldColumn  gui=bold    
" highlight Folded      gui=italic  
" highlight LineNr      gui=NONE    

"
" override default L and H methods which I never use
" go to first/last character of line
noremap H ^
noremap L g_
noremap gH g^
noremap gL g$

" from practical vim turned off, using c-l to navigate instead
" nnoremap <silent> <c-l> :<C-u>nohlsearch<CR><c-l>

" Netrw
" For netrw mappings: :h netrw-quickmap or see danidiaz github cheatsheet
" using <c-r>= causes ex mode to evaluate the vimscript
noremap <c-n> :Lex! <c-r>=expand('%:p:h')<CR><CR>
noremap <Leader>n :Lex! 

" From practical vim, navigate ex mode history with home row while retaining history filtering that arrow keys provide
cnoremap <c-p> <Up>
cnoremap <c-n> <Down>

" Commands
command! ClearRegs for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor
" Pretty Print JSON, HTML, and XML (set vim directory to match file)
command! PPJ %!python -m json.tool
command! PPH !tidy -mi -html -wrap 0 %
command! PPX !tidy -mi -xml -wrap 0 %

" Open current buffer's directory in Finder window
command! CurrentDir silent !open %:h

autocmd BufNewFile,BufRead *.md,*.txt call SetPlaintext()
function SetPlaintext()
    " setlocal tw=0 " no text width limit. If using this, remove 'a' from format options
    " set wrap " wrap visible lines
    setlocal linebreak " stop words from cutting off and carrying over onto next visible line when wrapping
    setlocal breakindent " indented space carries over from one line to the next
    setlocal fo+=a " paragraphs all on 1 line. uses tw=79 at a minimum. continuously enforce tw limits when inserting on existing line.
    setlocal fo+=w " makes 'a' work a bit nicer. Leave no trailing whitespace to denote paragraph has ended
    setlocal nojoinspaces " stop double spaces after punctuation
    setlocal foldopen-=block " don't let most navigational jumps open folds
    setlocal foldmethod=marker
    " Remappings below apply to all buffers opened
    nnoremap j gj
    nnoremap k gk
endfunction

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

hi Visual term=reverse ctermfg=251 ctermbg=60 guifg=#D0D0D0 guibg=#5F5F87
"" Syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
" if you want to search all buffers, try
" :bufdo! %s/FIND/REPLACE/g
" def function:
"autocmd BufRead,BufNewFile *.py setlocal nnoremap gd 
