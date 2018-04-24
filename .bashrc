# Colored ls output (colors vary by type of file)
export CLICOLOR=1
export LSCOLORS=DxFxCxDxBxegedabagaced
alias ls='ls -G'

# Change prompt (Lucas: Directory) color
# PS1='\[\e[0;33m\]\h:\W \u\$\[\e[m\] '

# Using a bare git repo to track my dotfiles
# Set up alias environment variables to easily modify repo from home directory using config in place of git
# eg config add .bash_profile; config commit -m "very meaningful message"
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
#config config --local status.showUntrackedFiles no
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
