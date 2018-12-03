# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ $(tty) == "/dev/tty1" ]; then
	cai-intro_menu
	exit 0
fi

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
