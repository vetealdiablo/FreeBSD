# --- CONFIGURAR EL PROMPT (PS1) CON COLORES PERSONALIZADOS ---

# Si es un terminal interactivo:
if [[ $- == *i* ]] ; then
	# Cambiar el título de la ventana del terminal (opcional)
	case ${TERM} in
		[aEkx]term*|rxvt*|gnome*|konsole*|interix)
			PS1='\[\033]0;\u@\h:\w\007\]'
			;;
		screen*)
			PS1='\[\033k\u@\h:\w\033\\\]'
			;;
		*)
			unset PS1
			;;
	esac

	# Establecer los colores para el prompt
	if [[ ${EUID} == 0 ]] ; then
		# Para el usuario root (nombre de usuario y host en rojo)
		PS1+='\[\033[01;31m\]\u\[\033[00m\]\[\033[01;08m\]@\[\033[00m\]\[\033[01;31m\]\h\[\033[00m\] \w \$ '
	else
		# Para el usuario normal (nombre de usuario y host en rojo)
		PS1+='\[\033[01;31m\]\u\[\033[00m\]\[\033[01;08m\]@\[\033[00m\]\[\033[01;31m\]\h\[\033[00m\] \w \$ '
	fi

	# Colores para ls, grep, etc.
	alias ls='ls --color=auto'
	alias grep='grep --colour=auto'
	alias egrep='egrep --colour=auto'
	alias fgrep='fgrep --colour=auto'

else
	# Si no es un terminal interactivo, solo mostrar el prompt sin colores
	PS1+='\u@\h \w \$ '
fi
