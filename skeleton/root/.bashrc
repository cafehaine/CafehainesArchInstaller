# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ $(tty) == "/dev/tty1" ]; then
	echo "Welcome to CafeHaine's Arch Installer !"
	echo ""
	echo "Please choose an action:"
	echo "1) Run wizard (default)"
	echo "2) Open shell"
	echo "3) Poweroff"

	read action
	case "$action" in
	"3")
		poweroff
		;;
	"2")
		echo "Good luck!"
		;;
	*)
		startx
		exit 0
		;;
	esac
fi

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
