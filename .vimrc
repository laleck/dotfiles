filetype plugin indent on
"Show existing tab with 2 spaces width
set tabstop=2
"When indenting with '>', use 2 spaces width
set shiftwidth=2
"On pressing tab, insert 2 spaces
set expandtab
set pastetoggle=<f5>
set number
set autoindent
set breakindent
"Maps jj as escape key when in insert view  
:imap jj <Esc>
syntax  on
"Keeps new lines tabbed in accordance with parent (useful for .txt, .Rmd files, can specify this in FileType)
"-= disables comment continutation
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
"Automatically loads changes to opened files without alerting
set autoread
"Change the colorscheme so people know you mean business
colo desert
