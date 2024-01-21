# [[file:.bashrc.org::*Path][Path:1]]
export JAVA_HOME="/usr/lib/jvm/java-11-openjdk"

export DENO_INSTALL="/home/pianka/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

export GOPATH="/home/pianka/go"

export PATH="$PATH:$GOPATH/bin"
export PATH="$PATH:/home/pianka/.gem/ruby/2.6.0/bin"
export PATH="$PATH:/home/pianka/.gem/ruby/2.7.0/bin"
export PATH="$PATH:/home/pianka/.local/share/gem/ruby/2.7.0/bin"
export PATH="$PATH:/home/pianka/.local/share/gem/ruby/3.0.0/bin"
export PATH="$PATH:/home/pianka/.local/bin"
export PATH="$PATH:$JAVA_HOME"
export PATH="$HOME/.yarn/bin:$PATH"
# Path:1 ends here

# [[file:.bashrc.org::*Editor][Editor:1]]
set -o vi

export EDITOR="vim"
export VISUAL="vim"
# Editor:1 ends here

# [[file:.bashrc.org::*Random settings][Random settings:1]]
# ~/.bashrc: executed by bast(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
#define GIT_COLOR_NORMAL “”
# Random settings:1 ends here

# [[file:.bashrc.org::*Random settings][Random settings:2]]
[ -z "$PS1" ] && return
# Random settings:2 ends here

# [[file:.bashrc.org::*Random settings][Random settings:3]]
HISTCONTROL=ignoreboth
# Random settings:3 ends here

# [[file:.bashrc.org::*Random settings][Random settings:4]]
shopt -s histappend
# Random settings:4 ends here

# [[file:.bashrc.org::*Random settings][Random settings:5]]
HISTSIZE=1000
HISTFILESIZE=2000
# Random settings:5 ends here

# [[file:.bashrc.org::*Random settings][Random settings:6]]
shopt -s checkwinsize
# Random settings:6 ends here

# [[file:.bashrc.org::*Random settings][Random settings:7]]
#shopt -s globstar
# Random settings:7 ends here

# [[file:.bashrc.org::*Random settings][Random settings:8]]
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"
# Random settings:8 ends here

# [[file:.bashrc.org::*Random settings][Random settings:9]]
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi
# Random settings:9 ends here

# [[file:.bashrc.org::*Random settings][Random settings:10]]
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac
# Random settings:10 ends here

# [[file:.bashrc.org::*Random settings][Random settings:11]]
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
  # We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
# Random settings:11 ends here

# [[file:.bashrc.org::*Random settings][Random settings:12]]
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi
# Random settings:12 ends here

# [[file:.bashrc.org::*Random settings][Random settings:13]]
stty -ixon

if [ "$0" = "/usr/sbin/lightdm-session" -a "$DESKTOP_SESSION" = "i3" ]; then
	export $(gnome-keyring-daemon -s)
fi

export TERM=screen-256color

complete -cf sudo
# Random settings:13 ends here

# [[file:.bashrc.org::*PS1][PS1:1]]
if [ "$color_prompt" = yes ]; then
#    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    PS1='${debian_chroot:+($debian_chroot)}\[\033[0;37m\][\t][\[\033[00;34m\]\u\[\033[0;37m\]@\[\033[32m\]\h\[\033[0;37m\]]\[\033[0;31m\]`git branch 2>/dev/null | grep \* | head -1 | sed "s/\* //g" |     awk "{ print \"(\"\\\$1 \")\" }"` \[\033[1;33m\]\w \[\033[0;33m\]\$ \[\033[00m\]'

else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
	PS1='\[\033[0;37m\][\t][\[\033[00;34m\]\u\[\033[0;37m\]@\[\033[32m\]\h\[\033[0;37m\]]\[\033[0;31m\]`git branch 2>/dev/null | grep \* | head -1 | sed "s/\* //g" | awk "{ print \"(\"\\\$1 \")\" }"` \[\033[1;33m\]\w \[\033[0;33m\]\$ \[\033[00m\]'
	;;
*)
    ;;
esac
# PS1:1 ends here

# [[file:.bashrc.org::*Aliases][Aliases:1]]
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias battery="acpi"
alias weather="curl wttr.in/genova"
alias gcs="google-chrome-stable"
# Aliases:1 ends here

# [[file:.bashrc.org::*SSH connections][SSH connections:1]]
alias pi='ssh pi@192.168.1.201'
alias server='ssh pianka@tapandfish.com -i ~/.ssh/github'
# SSH connections:1 ends here

# [[file:.bashrc.org::*Opening stuff][Opening stuff:1]]
alias gcs="google-chrome-stable"
alias artists="gcs artists.spotify.com & gcs artists.apple.com & gcs artists.amazon.com"
alias artists="gcs artists.spotify.com & gcs artists.apple.com & gcs artists.amazon.com"
# Opening stuff:1 ends here

# [[file:.bashrc.org::*Stuff I should be using but maybe it's too late][Stuff I should be using but maybe it's too late:1]]
# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
# Stuff I should be using but maybe it's too late:1 ends here

# [[file:.bashrc.org::*NVM][NVM:1]]
if [ -s "${HOME}/.nvm/nvm.sh" ] && [ ! "$(type -t __init_nvm)" = function ]; then
    export NVM_DIR="${HOME}/.nvm"
    [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
    declare -a __node_commands=('nvm' 'node' 'npm' 'yarn' 'gulp' 'grunt' 'webpack')
    function __init_nvm() {
        for i in "${__node_commands[@]}"; do unalias $i; done
        . "$NVM_DIR"/nvm.sh
        unset __node_commands
        unset -f __init_nvm
    }
    for i in "${__node_commands[@]}"; do alias $i='__init_nvm && '$i; done
fi
# NVM:1 ends here

# [[file:.bashrc.org::*Ranger][Ranger:1]]
export RANGER_LOAD_DEFAULT_RC=FALSE
# Ranger:1 ends here

# [[file:.bashrc.org::*Tmux][Tmux:1]]
if [ -x "$(command -v tmux)" ] && [ -n "${DISPLAY}" ] && [ -z "${TMUX}" ]; then
    exec tmux -u
fi
# Tmux:1 ends here
