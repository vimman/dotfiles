# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Path to gnu utils installed by init.sh
# export PATH="$PATH:$(brew --prefix coreutils)/libexec/gnubin:"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="wedisagree"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git brew osx )

source ~/.oh-my-zsh/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8 fr_FR.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias top=htop

# history shortcuts (from plugin 'history')
alias h='history'
function hs
{
	history | grep $*
}
alias hsi='hs -i'

# Vim is now neovim
alias v="nvim"
alias vin="nvim"
alias vim="nvim"
alias vi="/usr/bin/vim"

# Vim is everywhere
alias :q="exit"

# 42FileChecker is on the place
alias 42="~/depots/42FileChecker/42FileChecker.sh"

# Color man pages
man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}

# Connection to FreeWifi hotspot
freewifi()
{
	source ~/dotfiles/.freepass
	gw=$(ip r |grep default |awk '{print $3}')
	if ! (ping -c 1 -w 1 $gw >/dev/null 2>&1) && [[ `uname` == Linux ]]
	then
		nmcli c down FreeWifi
		nmcli c up FreeWifi
	elif ! (ping -c 1 -w 1 $gw >/dev/null 2>&1) && [[ `uname` == Darwin ]]
	then
		networksetup -setairportpower en1 off
		networksetup -setairportpower en1 on
	elif ! (ping -c 1 -w 1 $gw >/dev/null 2>&1)
	then
		echo "connection troubles"
	else
		echo "connection is ok"
	fi
	while ! ping -c 1 -w 1 $gw >/dev/null 2>&1; do
		gw=$(ip r |grep default |awk '{print $3}')
	done
	
	i=0
	while ! ping -c 1 -w 1 google.fr >/dev/null 2>&1; do
		curl -d "login=$FREE_LOGIN&password=$FREE_PASS" https://wifi.free.fr/Auth >/dev/null 2>&1
		i=$((i+1))
		echo -ne "\x1b\x5b80D>> Not connected, retrying | tried \x1b[31m$i\x1b[00m times"
	done
	
	if [ $i -eq 0 ] ; then
		echo ">> Already connected to FreeWifi"
	else
		echo -e "\n>> You are connected"
	fi
	
	ping $gw
}

export VISUAL="vim"

# add .script to path
export PATH="$PATH:$HOME/.script"

# make ctrl-u act as usual
bindkey \^U backward-kill-line

# Shell integration for iterm
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Load Homebrew config script
if [ -e $HOME/.brewconfig.zsh ]
then
	source $HOME/.brewconfig.zsh
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Highlight in less (needs to install source-highlight)
export LESSOPEN="| ~/.source-highlight/src-hilite-lesspipe.sh %s"
export LESS=' -R -N --shift 5 '
export LESSCOLOR=always
export LESSCOLORIZER=~/.source-highlight/src-hilite-lesspipe.sh

# Add man pages from git repo
export MANPATH=:~/depots/man

mantopdf()
{
	man -a -t $1 | pstopdf -i -o $1.pdf > /dev/null 2>&1
}

if [ -e /Applications/calibre.app ]
then
	export PATH="$PATH:/Applications/calibre.app/Contents/console.app/Contents/MacOS"
fi

mantoepub()
{
	man -a -t $1 | pstopdf -i -o $1.pdf > /dev/null 2>&1 &&\
		ebook-convert $1.pdf $1.epub > /dev/null 2>&1 && rm $1.pdf
}

# Makes ranger to open files with neovim
export EDITOR='nvim'

# Try to connect to a tmux session if there is one
tmux a 2>/dev/null
