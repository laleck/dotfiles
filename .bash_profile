## Existing Auto-complete has been deprecated, fix later 
#if [ -f $(brew --prefix)/etc/bash_completion ]; then
#  . $(brew --prefix)/etc/bash_completion
#fi

# Note to self: bashrc called everytime new terminal is opened, while bash_profile just called on initial login
# Track all bash changes in .bashrc
if [ -f ~/.bashrc ]; then
     source ~/.bashrc
fi

