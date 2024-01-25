#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc
export TERMINAL=/usr/bin/alacritty
export PATH=~/.cargo/bin:$PATH

#Disabled because my windows machine already swaps caps and escape and im using a VM right now.
#Excellent example of default config that can be overriden by a user config.
#setxkbmap -option caps:swapescape

#The default repeat rate is for sloths. This sets it to something more reasonable.
xset r rate 175 80
