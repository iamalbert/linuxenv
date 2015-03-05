if [ "$PROGPATH" = "" ]; then
  export PROGPATH=$HOME/.usr
fi
export OLDPATH=$PATH
export PATH=$PROGPATH/bin:$PROGPATH/share/bin:$PATH
export LD_LIBRARY_PATH=$PROGPATH/lib:$PROGPATH/libexec:$PROGPATH/lib64:$PROGPATH/local/cuda-6.5/lib64:$LD_LIBRARY_PATH
export C_INCLUDE_PATH=$PROGPATH/include
export CPLUS_INCLUDE_PATH=$PROGPATH/include

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
#ZSH_THEME="jreese"
#ZSH_THEME="lukerandall"
#ZSH_THEME="risto"
if [ "$ZSH_THEME" = "" ]; then
  ZSH_THEME="michelebologna"
fi

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias md='mkdir'
alias mv='mv -vi'
alias rm='rm -vi'
alias cp='cp -vi'
alias ..='cd ..'
alias ...='cd ../..'
alias e='exit'
alias 's-s'='sudo -s'
alias v='vim'
alias cls='clear'
alias top='htop -u $USER'
alias more='less'
alias freemem='echo 3 > /proc/sys/vm/drop_caches'
alias tmux='tmux -2'
alias td='tmux detach-session'
alias ohmyzsh="mate ~/.oh-my-zsh"

function ta() {
  if [ $# -ne 0 ]; then
    tmux -2 attach -t $* || tmux -2 new -s $*
  else
    tmux -2 attach || tmux -2 new
  fi
}
function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}

function port_forward(){
  sh -c  "while true; do nc -v -l -p $2 -c ' nc localhost $1 '; done"
}

setopt append_history no_inc_append_history no_share_history




stty -ixon
export DISABLE_AUTO_TITLE="true"

alias test_disc_speed='dd if=/dev/zero of=speedtest bs=64k count=3200 conv=fdatasync; dd if=speedtest of=/dev/null; rm -f speedtest'
TERM=xterm-256color

if [ -f "$HOME/.zshrc.local" ]; then
  source "$HOME/.zshrc.local"
fi

function mssh(){
  
  for i in $@ ; do
    echo $i
    tmux splitw "ssh $i"
    tmux select-layout tiled 
  done 
  tmux select-pane -t 1
}
