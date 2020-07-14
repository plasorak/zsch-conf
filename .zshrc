READNULLCMD=${PAGER:-/usr/bin/pager}

## set variables

XDG_CONFIG_HOME="$HOME/.config"
XDG_CACHE_HOME="$HOME/.cache"

export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="false"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="false"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
plugins=(git
	 osx
	 web-search
	 colored-man-pages
	 dash
	 dircycle
	)

source $ZSH/oh-my-zsh.sh

if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

    autoload -Uz compinit
    compinit
fi
# various stuff to make the commands more sane
alias mv='nocorrect mv -i'      # prompt before overwriting files
alias mkdir='nocorrect mkdir'   # don't correct mkdir
alias man='nocorrect man'
alias wget='noglob wget'
alias gpg='gpg --no-use-agent'
alias grep='grep --color=auto'
alias scp='noglob scp_wrap'

# useful to see what hogs your disk (this is so i can actually find this damn alias in here: find disk space)
# this will most likely die soon. ncdu is way better
alias sz='du -ax | sort -n | tail -n 10'

# various stuff from thailand
alias dh='df -h'
alias dm='df -m'


alias zshconfig="emacs ~/.zshrc"
alias ohmyzsh="emacs ~/.oh-my-zsh"

alias root="root -l"
alias r="root -l"

alias rm="rm -i"
alias le="less"
alias l="ls -a -l -h"

alias clean='rm -f *~; rm -f \#*#; rm -f .#*'
alias rm='rm -i'
alias rmrf='rm -rf'
alias du='du -hs'
if [ -e /usr/local/opt/python@3.8 ]; then
    export PATH="/usr/local/opt/python@3.8/bin:$PATH"
    export PYTHON_EXECUTABLE=/usr/local/bin/python3

fi
# export PATH="/usr/local/opt/python@3.8/bin:$PATH"
alias maken='make -j`nproc`'

if [ -e $HOME/.iterm2_shell_integration.zsh ]; then
    export ITERM_ENABLE_SHELL_INTEGRATION_WITH_TMUX=1
    source $HOME/.iterm2_shell_integration.zsh
fi

# Disable globbing on the remote path.
alias scp='noglob scp_wrap'
function scp_wrap {
  local -a args
  local i
  for i in "$@"; do case $i in
    (*:*) args+=($i) ;;
    (*) args+=(${~i}) ;;
  esac; done
  command scp "${(@)args}"
}
function rename_tab {
    echo "Renaming current tab to $@"
}
alias start_apache='sudo /opt/lampp/manager-linux-x64.run'

alias l='/bin/ls -lh'
alias la='/bin/ls -A'
alias lrt='/bin/ls -lhrt'
alias lrtr='/bin/ls -lhrt *.root'
alias ls='/bin/ls -CF'
alias nproc='sysctl -n hw.logicalcpu'
alias python='python3'
if [ -e ${HOME}/root/bin/thisroot.sh]; then
    source ${HOME}/root/bin/thisroot.sh
fi

if [ -e /Users/pierrelasorak/Documents/ROOT/pythia6/libPythia6.dylib ]; then
    export PYTHIA6_LIBRARY=/Users/pierrelasorak/Documents/ROOT/pythia6/libPythia6.dylib
fi
