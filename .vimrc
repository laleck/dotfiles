let mapleader=" " "this should be asssigned before it's referenced
" set nocompatible              " guess this is no longer required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

let $PATH = $PATH . ':/Users/lucasaleck/.pyenv/shims'
"" Git
" gitgutter shows changes since revision but can add lots of lag
" Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
" Plugin 'Xuyuanp/nerdtree-git-plugin' "tbd check it out
"
"" Themes
Plugin 'dracula/vim', {'name': 'dracula'}

"" Navigation
Plugin 'tpope/vim-unimpaired'
Plugin 'kien/ctrlp.vim'
" Plugin 'preservim/nerdtree'
Plugin 'tpope/vim-vinegar'

"" Text editing
Plugin 'tpope/vim-surround'
" Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-eunuch'
" [In/De]rement dates with ctrl-[a/x]
Plugin  'tpope/vim-speeddating'

"" Linting
" Plugin 'dense-analysis/ale'
" Plugin 'valloric/youcompleteme'
" insert-mode caps lock: ctrl-gc gC in normal mode for true caps lock
" Plugin 'tpope/vim-capslock'
" Plugin 'jez/vim-superman'
" :JsonPython echoes the path under cursor
" Plugin 'mogelbrod/vim-jsonpath'
"" Markdown
" Plugin 'plasticboy/vim-markdown'
" Plugin 'JamshedVesuna/vim-markdown-preview'

"" Additonal Functionality
Plugin 'nathangrigg/vim-beancount'
Plugin 'lambdalisue/vim-pyenv'
" GNU recutils syntax and folding
Plugin 'zaid/vim-rec'
" Transposte text
Plugin 'salsifis/vim-transpose'
" Quick addition
Plugin 'EvanQuan/vmath-plus'
" Quick search based on highlighted text
Plugin 'nelstrom/vim-visual-star-search'
Plugin 'vimwiki/vimwiki'

" Colors/themes
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'altercation/vim-colors-solarized'
"" Language support
" Plugin 'scrooloose/syntastic'
" Plugin 'lervag/vimtex'

call vundle#end()            " required
filetype plugin indent on    " required
filetype plugin on           " vimwiki wants this

"
" Plugin options, variables, and remaps
" 
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v^(Movies|Pictures|Music)$',
  \ }

let g:ale_pattern_options = {
\   '.*\.json$': {'ale_enabled': 0},
\   '.*\.bean$': {'ale_enabled': 0},
\}

let g:ctrlp_working_path_mode = 'rc'
let g:ctrlp_buffer_func = { 'enter': 'MyCtrlPMappings' }
func! MyCtrlPMappings()
    nnoremap <buffer> <silent> <c-@> :call <sid>DeleteBuffer()<cr>
endfunc

nnoremap <Leader>i :CtrlPMRUFiles<CR>
nnoremap <Leader>b :CtrlPBuffer<CR>
nnoremap <Leader><Leader>b :ls<CR>:b

" vmath settings -- warning overwrites a couple of registers
nnoremap <leader>ma <Plug>(vmath_plus#normal_analyze)
nnoremap <leader>mba <Plug>(vmath_plus#normal_analyze_buffer)
xnoremap <leader>ma <Plug>(vmath_plus#visual_analyze)
xnoremap <leader>mba <Plug>(vmath_plus#visual_analyze_buffer)

" Recalculate shortcut, cut highlighted text and enter ex-mode in = register with that text
vnoremap <Leader>mx xi<C-r>=<C-r>"
" yank highlighted text to m (math) register, find '=', delete WORD, insert calculation result
vnoremap <Leader>m= "myA = <C-r>=<C-r>m

nnoremap <leader>gs :Git<CR>

nnoremap <leader>gl :GcLog<CR>
nnoremap <leader>ge :Gedit<CR>
" this shows all versions for current file
nnoremap <leader>gll :0GcLog<CR>
nnoremap <leader>gv :Gvdiffsplit<CR>
autocmd BufEnter fugitive://* setlocal foldmethod=syntax

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

let g:vimwiki_folding='custom'
let g:vimwiki_list = [{'path': '~/vimwiki/', 'listsyms': '✗○◐●✓'}] " task status moved by gln and glp


" noremap <c-n> :NERDTreeToggle<CR>
" open nerdtreee on current buffer instead of pwd
" noremap <leader>n :NERDTreeToggle <c-r>=expand('%:h')<CR><CR>

" In ~/.vim/ftplugin/python.vim

" Check Python files with flake8 and pylint.
" let b:ale_linters = ['flake8', 'pylint']
" " Fix Python files with autopep8 and yapf.
" let b:ale_fixers = ['autopep8', 'yapf']
" " Disable warnings about trailing whitespace for Python files.
" let b:ale_warn_about_trailing_whitespace = 0

"
" Basic Settings
"

if has("gui_running")
  if hostname() =~ '^LA'
    set guifont=Menlo:h12 " personal machine
  else
    set guifont=Menlo:h14 " work machines
  endif
  set guicursor=n:blinkwait0-blinkon1-blinkoff0 "don't blink cursor in normal
  colorscheme dracula
else
  set background=dark
  colorscheme solarized
  let g:airline_theme='solarized'
  let g:airline_solarized_bg='dark'
  let g:solarized_menu=0
  let g:solarized_termcolors=256
  " colorscheme dracula
endif 

" amount of time between swp writes. useful for gitgutter (default 4000)
set updatetime=100
" set timeoutlen=1000
" set ttimeoutlen=100
" ***** ***** ***** ***** ***** ***** ***** ***** *****
" set textwidth=120
set textwidth=0
" note tab settings are overridden when dealing with python files
set expandtab " tab will insert n amount of spaces instead, see softtabstop
set tabstop=2 " number of spaces a tab counts for, my files rarely have actual tabs
set softtabstop=2 " how many spaces a tab press inserts
set shiftwidth=2 " indentation by 2 spaces
set autoindent
set breakindent
set pastetoggle=<f5>
set number
set hidden " don't ask to save buffer when navigating away
syntax on
syntax enable
set splitright " open new splits on right
set autoread
set shortmess+=I
set foldmethod=syntax
set nofoldenable "turn off folding by default; toggle with zi
set showcmd " show command building keystrokes in normal mode
set gdefault " show command building keystrokes in normal mode
set ignorecase
set formatoptions=tcqj
" set incsearch
set nohlsearch " turn off search highlighting think this is also controlled by h in viminfo
set nowrapscan " stop search at end of file
set confirm " exit vim with unsaved files
set undofile " persistent undo
set undodir=~/.vim/undo
set backup
set backupdir=~/.vim/backup
set dir=~/.vim/swap " localize swp files
set viminfo='500,f1,<50,s10,:200,h,n~/.vim/viminfo " backup settings for registers and marks, see help

set spelllang=en_us
set spelloptions=camel
syn match myExCapitalWords +\<[A-Z]\w*\>+ contains=@NoSpell "IF IM YELLIN IDC BOUT SPELING

"View nonbreaking whitespace
" set list
" set lcs=tab:╋━,trail:·,nbsp:␣
" set colorcolumn=80 "

" set statusline=%b " localize swp files
" show utf-8 code in hex on statusline
" enter utf-8 code by typing ^vu[4 digit hex code]
" set statusline=%B
" make current buffer's directory the local directory
" autocmd BufEnter * silent! lcd %:p:h
"
" Use %% as macro for current buffer's directory from Practical Vim
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" cnoremap <expr> :: getcmdtype() == ':' ? <C-u>vsplit $MYVIMRC<cr> : '::'
" cnoremap <expr> :: getcmdtype() == ':' ? execute 'call ctrlp#init(1)' : '::'

" cabbr <expr> %% expand('%:p:h')
" In lieu of using :NoMatchParen on every buffer, this will turn off paren highlighting
let g:loaded_matchparen=1

" " insert highlighted text into ex mode
" vnoremap <Leader>: y:<C-r>"<C-b>

" These are to cancel the default behavior of d, D, c, C to put the text they delete in the default register.
nnoremap d "_d
vnoremap d "_d
nnoremap D "_D
vnoremap D "_D
nnoremap c "_c
vnoremap c "_c
nnoremap C "_C
vnoremap C "_C

inoremap jj <Esc>

" window max
" noremap <Leader>wm <c-w>_<c-w>|
nnoremap <Esc><Esc> :noh<Return>
"Jump to ex mode from normal mode and cycle through previous commands
" noremap <c-p> :<c-p>

" Easy and intuitive buffer and split-view navigation
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <Leader>v <c-w>v
nnoremap <Leader>h <c-w>s

" Arrow keys to always navigate by visible line
nnoremap <Up> gk
nnoremap <Down> gj

" normal and visual modes. remember: {visual}zf
" noremap <leader>f zfzc
vnoremap <Left> zfzc
nnoremap <Left> zc
nnoremap <Right> zo
" override default L and H methods, go to first/last character of line
noremap H ^
noremap L g_
noremap gH g^
noremap gL g$

" go back to last buffer (more ergonomic to use ctrl-p buffers)
nnoremap <c-_> <c-^>
nnoremap <Leader>q :q<CR>

" from practical vim,
" nnoremap <silent> <c-l> :<C-u>nohlsearch<CR><c-l>

" Netrw
" For netrw mappings: :h netrw-quickmap or see danidiaz github cheatsheet
" using <c-r>= causes ex mode to evaluate the vimscript
" noremap <c-n> :Lex! <c-r>=expand('%:p:h')<CR><CR>

" From practical vim, navigate ex mode history with home row while retaining history filtering that arrow keys provide
cnoremap <c-p> <Up>
cnoremap <c-n> <Down>

" make n/N always go in the same direction and keep search cursor centered
nnoremap <expr> n 'Nn'[v:searchforward] . "zzzv"
nnoremap <expr> N 'nN'[v:searchforward] . "zzzv"

" keep cursor in place on joins. uses the z mark
nnoremap J mzJ`z

" insert iso-8601 date on new line below cursor and enter input
nnoremap <leader>O O<C-R>=strftime("%Y-%m-%d\n")<CR>
nnoremap <leader>o o<C-R>=strftime("%Y-%m-%d\n")<CR>

" prepend current date and append USD (use for beancount price directives)
" vnoremap <Leader>i :s/^.*$/<C-R>=strftime("%Y-%m-%d")<CR> price \0 USD/<CR>
vnoremap <Leader>p :s/^.*$/<C-R>=strftime("%Y-%m-%d")<CR> price \0 USD/<CR>
" vnoremap <leader>i <C-R>=strftime("%Y-%m-%d\n")<CR>

nnoremap <leader>fo :set formatoptions-=a;set tw=0<CR>
nnoremap <leader>cr :ClearRegs<CR>
nnoremap <leader>cc :ccl<CR>

"
" Commands and Functions
"
command! Diff vert diffsplit ~/.vim/backup/%:t~
command! ClearRegs for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor
" Pretty Print JSON, HTML, and XML (set vim directory to match file)
command! PPJ %!python -m json.tool
command! PPH !tidy -mi -html -wrap 0 %
command! PPX !tidy -mi -xml -wrap 0 %

" Open current buffer's directory in Finder window or use !open %%
" command! CurrentDir silent !open %:h

" Idea was to make my global R mark always be at top of q&a file
" Not a great implementation (ChatGPT), relies on file name but good enough
augroup MyMarks
  autocmd!
  autocmd BufEnter q&a.txt if line("'R") > 1 | execute "normal! ggmR" | endif
augroup END

" autocmd
" Can I do just bufnewfile?
autocmd BufNewFile,BufRead *.bean call SetBeancount()
function SetBeancount()
  setlocal foldopen-=block
  setlocal textwidth=0
endfunction

autocmd BufRead *.wiki call SetVimWiki()
function SetVimWiki()
  " setlocal textwidth=0
  setlocal nofoldenable
  setlocal spell
  " ignore sentences or phrases that start with lowercase word
  setlocal spellcapcheck=
endfunction

autocmd BufNewFile,BufRead *.md,*.txt call SetPlaintext()
function SetPlaintext()
    setlocal textwidth=0 " no text width limit. If using this, remove 'a' from format options
    " setlocal fo+=a " paragraphs all on 1 line. sets tw=79 at a minimum. continuously enforce tw limits when inserting on existing line.
    setlocal formatoptions+=w " makes 'a' work a bit nicer. Leave no trailing whitespace to denote paragraph has ended
    " set wrap " wrap visible lines
    setlocal linebreak " stop words from cutting off and carrying over onto next visible line when wrapping
    setlocal breakindent " indented space carries over from one line to the next
    " setlocal fo+=1 " don't break line after one-letter word
    setlocal nojoinspaces " stop double spaces after punctuation
    setlocal foldopen-=block " stop most navigational jumps from opening folds
    setlocal foldmethod=marker
    " Remappings below apply to all buffers opened
    nnoremap j gj
    nnoremap k gk
    " noremap H g^
    " noremap L g$
endfunction

func! s:DeleteBuffer()
    let line = getline('.')
    let bufid = line =~ '\[\d\+\*No Name\]$' ? str2nr(matchstr(line, '\d\+'))
        \ : fnamemodify(line[2:], ':p')
    exec "bd" bufid
    exec "norm \<F5>"
endfunc

function! TrimTrailingWhitespace() abort
  let _s=@/ " Store last search
  let l = line(".") " Store cursor position
  let c = col(".")
  %!git stripspace "Strip white space 
  " Clean up
  let @/=_s " Restore previous search history
  call cursor(1, c) " Restore cursor position
  echo "-- DELETED TRAILING WHITESPACE --"
endfunction
command! TrimTrailingWhitespace execute "call TrimTrailingWhitespace()"

" Collect all todos across vimwiki in quickfix list
function! TodoSearch(filepattern)
    if a:filepattern == ""
        let l:filepattern = '**/*'
    else
        let l:filepattern = a:filepattern
    endif

    silent! execute 'cexpr []'
    silent! execute 'vimgrep /\[.\]/ ' . l:filepattern
    copen
endfunction
command! TODO execute 'call TodoSearch("~/vimwiki/**/*.wiki")'

" make ctrl-p ignore files that vim doesn't use
set wildignore+=*.git,*.hg,*.svn
set wildignore+=*.steam,*.cache
set wildignore+=*.aux,*.out,*.toc
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest,*.rbc,*.class
set wildignore+=*.ai,*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png,*.psd,*.webp
set wildignore+=*.avi,*.divx,*.mp4,*.webm,*.mov,*.m2ts,*.mkv,*.vob,*.mpg,*.mpeg,*.m4v
set wildignore+=*.mp3,*.oga,*.ogg,*.wav,*.flac,*.aac
set wildignore+=*.eot,*.otf,*.ttf,*.woff
set wildignore+=*.doc,*.pdf,*.cbr,*.cbz
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz,*.kgb
set wildignore+=*.swp,.lock,.DS_Store,._*
