#
# bashrc
# Provide a sane default starting point.
# This can be overridden in the ~/.bashrc
#

alias ls='ls --color=auto'
alias grep='grep --color=auto'

PS1="\$?|\u|\W|$ "
PS2="\$?|\u|\W=> "
set -o vi
alias vi=nvim
alias vim=nvim

export XDG_CONFIG_HOME="$HOME/.config"
