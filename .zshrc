# Run source .bashrc after changing to update existing terminal window
# Colored ls output (colors vary by type of file)
export CLICOLOR=1
export LSCOLORS=DxFxBxDxCxegedabagaced
export EDITOR=/usr/local/bin/vim
alias ls='ls -G'
#alias mysql="/usr/local/mysql/bin/mysql"
alias git-school='ssh-add -D;ssh-add ~/.ssh/school'
alias git-self='ssh-add -D;ssh-add ~/.ssh/id_rsa'
alias ssh-pi='ssh pi@192.168.0.175'

# vim-superman plugin. Open man pages with vim
export PATH="$PATH:$HOME/.vim/bundle/vim-superman/bin"

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)   # Include hidden files.

# Edit line in vim with ctrl-x:
autoload edit-command-line; zle -N edit-command-line
bindkey "^x" edit-command-line

# Go forward and back by a word with ctrl-f ctrl-b
bindkey "^f" vi-forward-blank-word
bindkey "^b" vi-backward-blank-word

# Filter history using what's already typed
bindkey "^p" history-beginning-search-backward
bindkey "^n" history-beginning-search-forward
# Filter history with arrow keys
# bindkey "^[[A" history-beginning-search-backward
# bindkey "^[[B" history-beginning-search-forward

# Use Anon prompt
# export PROMPT="User %1~ %# "

# Using a bare git repo to track my dotfiles
# Set up alias environment variables to easily modify repo from home directory using config in place of git
# eg config add .bash_profile; config commit -m "very meaningful message"
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
#config config --local status.showUntrackedFiles no

# Supposed to be used for easier fzf. Can't get to work
# bindkey "ç" fzf-cd-widget
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPS="--extended"
