let mapleader=" " "this should be asssigned before it's referenced
" set nocompatible              " guess this is no longer required
filetype off " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

"" Git
Plugin 'tpope/vim-fugitive'
" gitgutter shows changes since revision but can add lots of lag
" Plugin 'airblade/vim-gitgutter'
" Plugin 'Xuyuanp/nerdtree-git-plugin' "tbd check it out

" Colors/themes
Plugin 'dracula/vim', {'name': 'dracula'}
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

"" Navigation
Plugin 'tpope/vim-unimpaired'
Plugin 'kien/ctrlp.vim' " should also look into command-t plugin
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

"" Language support
" Plugin 'scrooloose/syntastic'
" Plugin 'lervag/vimtex'

"" Additonal Functionality
Plugin 'nathangrigg/vim-beancount'
" GNU recutils syntax and folding
Plugin 'zaid/vim-rec'
" Transposte text
Plugin 'salsifis/vim-transpose'
" Quick addition
Plugin 'EvanQuan/vmath-plus'
" Quick search based on highlighted text
Plugin 'nelstrom/vim-visual-star-search'
Plugin 'aleck2/vimwiki-dev' " has glp key binding for previous task
" Plugin 'junegunn/vader.vim'

call vundle#end()            " required
filetype plugin indent on    " required
filetype plugin on           " vimwiki wants this
runtime! ftplugin/man.vim    " view man pages from vim

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

" nnoremap <leader>gs :Git<CR> " replaced with toggle function
nnoremap <leader>gl :GcLog<CR>
nnoremap <leader>ge :Gedit<CR>
" this shows all versions for current file
nnoremap <leader>gll :0GcLog<CR>
nnoremap <leader>gv :Gvdiffsplit<CR>

" vimwiki but using for across all filetypes
nnoremap gl< <Plug>VimwikiDecrementListItem
nnoremap gl> <Plug>VimwikiIncrementListItem

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
" vimwiki_list broke task syntax matching
" let g:vimwiki_list = [{'path': '~/vimwiki/', 'listsyms': '✗○◐●✓'}]

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
    Plugin 'lambdalisue/vim-pyenv'
    let $PATH = $PATH . ':' . expand('~/.pyenv/shims') " work machine doesn't use pyenv
  else
    set guifont=Menlo:h14 " work machines
  endif
  set guicursor=n:blinkwait0-blinkon1-blinkoff0 " don't blink cursor in normal
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

syntax on
syntax enable

" tab settings are overridden when dealing with python files
set expandtab " tab will insert n amount of spaces instead, see softtabstop
set tabstop=2 " number of spaces a tab counts for, my files rarely have actual tabs
set softtabstop=2 " how many spaces a tab press inserts
set shiftwidth=2 " indentation by 2 spaces
set autoindent
set breakindent " wrapped lines continue visually indented

set textwidth=0
set formatoptions=tcqj
set scrolloff=7 "min number of screen lines to keep above/below cursor

set foldmethod=syntax
set nofoldenable " turn off folding by default; toggle with zi

set pastetoggle=<f5>
set shortmess+=I
set number
set showcmd " show command building keystrokes in normal mode

set autoread
set hidden " don't ask to save buffer when navigating away
set confirm " exit vim with unsaved files
set splitright " open new splits on right
set updatetime=100 " amount of time between swp writes (like for gitgutter)

" set incsearch " match search as you type
set gdefault " default g substitute flag (all occurences on line). Add g in search to negate this; gg to ensure on
set ignorecase
set nohlsearch " turn off search highlighting think this is also controlled by h in viminfo
set nowrapscan " stop search at end of file
let g:loaded_matchparen=1 " think this turns off matching open/close brace highlighting

set undofile " persistent undo
set undodir=~/.vim/undo
set backup
set backupdir=~/.vim/backup
set dir=~/.vim/swap " localize swp files
set history=200
set viminfo='100,f1,<50,s10,h,n~/.vim/viminfo " backup settings for registers and marks, see help 'viminfo'

set spelllang=en_us
set spelloptions=camel
" Need to review why this isn't working in vimwiki. Plugin probably overriding
" it, might need custom syntax file - not sure how this stuff works
syn match myExCapitalWords +\<[A-Z]\w*\>+ contains=@NoSpell "IF IM YELLIN IDC BOUT SPELING

"
" Remaps
"
inoremap jj <Esc>

" Cancel the default behavior of d, D, c, C - do not save deletions into register (except for `-` with c, C)
nnoremap d "_d
vnoremap d "_d
nnoremap D "_D
vnoremap D "_D
nnoremap c "_c
vnoremap c "_c
nnoremap C "_C
vnoremap C "_C

" paste over currently selected text without yanking deleted text
xnoremap p P

" override default L and H methods, go to first/last character of line
noremap H ^
noremap L g_
noremap gH g^
noremap gL g$

" window max
nnoremap <Esc><Esc> :noh<Return>

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

" go back to last buffer (more ergonomic to use ctrl-p buffers)
" maybe try gb for this
nnoremap <c-_> <c-^>
nnoremap <Leader>q :q<CR>

" keep cursor in place on joins. uses the z mark
nnoremap J mzJ`z

" insert iso-8601 date on new line below cursor and enter input
nnoremap <leader>O O<C-R>=strftime("%Y-%m-%d\n")<CR>
nnoremap <leader>o o<C-R>=strftime("%Y-%m-%d\n")<CR>

nnoremap <leader>fo :set formatoptions-=a;set tw=0<CR>
nnoremap <leader>cr :ClearRegs<CR>
nnoremap <leader>cc :ccl<CR>

" From practical vim, navigate ex mode history with home row while retaining history filtering that arrow keys provide
cnoremap <c-p> <Up>
cnoremap <c-n> <Down>

" make n/N always go in the same direction and keep search cursor centered
nnoremap <expr> n 'Nn'[v:searchforward] . "zzzv"
nnoremap <expr> N 'nN'[v:searchforward] . "zzzv"
" repeatable replace word under cursor
nnoremap c* *``cgn
nnoremap c# #``cgN

" Use %% as macro for current buffer's directory from Practical Vim
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" noremap <Leader>wm <c-w>_<c-w>|

" from practical vim,
" nnoremap <silent> <c-l> :<C-u>nohlsearch<CR><c-l>

" Jump to ex mode from normal mode and cycle through previous commands
" noremap <c-p> :<c-p>

" insert highlighted text into ex mode
" vnoremap <Leader>: y:<C-r>"<C-b>
" cnoremap <expr> :: getcmdtype() == ':' ? <C-u>vsplit $MYVIMRC<cr> : '::'
" cnoremap <expr> :: getcmdtype() == ':' ? execute 'call ctrlp#init(1)' : '::'

" view nonbreaking whitespace
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
" Commands and Functions
"
" command! Diff vert diffsplit ~/.vim/backup/%:t~
command! ClearRegs for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor
" Pretty Print JSON, HTML, and XML (set vim directory to match file)
command! PPJ %!python -m json.tool
command! PPH !tidy -mi -html -wrap 0 %
command! PPX !tidy -mi -xml -wrap 0 %

" Idea was to make my global R mark always be at top of q&a file
" Not a great implementation (ChatGPT), relies on file name but good enough
augroup MyMarks
  autocmd!
  autocmd BufEnter q&a.txt if line("'R") > 1 | execute "normal! ggmR" | endif
augroup END

" autocmd! breaking plugins. Sourcing these commands n-times is nbd
augroup beancount
  " autocmd! breaks beancount plugin
  " echom "beancount"
  " could do a slick
  autocmd BufNewFile,BufRead *.bean call SetBeancount()
augroup END

function SetBeancount()
  PyenvActivate
  setlocal foldopen-=block
  setlocal textwidth=0
  " make price directives from highlighted text copy/pasted from sheets
  vnoremap <buffer> <Leader>p :s/^.*$/<C-R>=strftime("%Y-%m-%d")<CR> price \0 USD/<CR>
  " jump to headings; folding unreliable in plugin, can't rely on: z[ z] & zj/zk
  nnoremap <buffer> <silent> [[ :call search('^\V****', 'Wb')<CR>zz
  nnoremap <buffer> <silent> ]] :call search('^\V****', 'W')<CR>zz
  " easier search for headings
  cnoremap <buffer> ?? ^\V****\v.*
endfunction

augroup fugitive
  " autocmd!
  " echom "fugitive"
  autocmd BufEnter fugitive://* setlocal foldmethod=syntax
augroup END

augroup vimwiki
  " autocmd! breaks vimwiki plugin
  autocmd BufEnter *.wiki call SetVimWiki()
augroup END

function SetVimWiki()
  " could probably tweak g vars for similar affect
  setlocal nofoldenable
  " setlocal textwidth=0
  " setlocal spell
  " ignore sentences or phrases that start with lowercase word
  setlocal spellcapcheck=
  " could add syn match to plugin syntax file
  syn match myExCapitalWords +\<[A-Z]\w*\>+ contains=@NoSpell
  setlocal modeline " these other settings are overriding my modelines, this restores it
endfunction

augroup plaintext
  " autocmd!
  autocmd BufNewFile,BufRead *.md,*.txt call SetPlaintext()
augroup END

function SetPlaintext()
    setlocal textwidth=0 " no text width limit. If using this,j remove 'a' from format options
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

" toggle fugitive git status window
function! ToggleGstatus() abort
  for l:winnr in range(1, winnr('$'))
    if !empty(getwinvar(l:winnr, 'fugitive_status'))
      exe l:winnr 'close'
      return
    endif
  endfor
  keepalt Git
endfunction
nnoremap <Leader>gs :call ToggleGstatus()<CR>

" Collect all todos across vimwiki in quickfix list
function! TodoSearch(filepattern)
    if a:filepattern == ""
        let l:filepattern = '**/*'
    else
        let l:filepattern = a:filepattern
    endif

    silent! execute 'cexpr []'
    silent! execute 'vimgrep /\[ ]/ ' . l:filepattern
    " silent! execute 'vimgrep /\[.\]/ ' . l:filepattern
    copen
endfunction
command! TODO execute 'call TodoSearch("~/vimwiki/**/*.wiki")'
command! WORK execute 'call TodoSearch("~/vimwiki/work/**/*.wiki")'

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
