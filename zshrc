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
  export ZSH_THEME="gentoo"
fi
export ZSH_THEME="gentoo"
#export ZSH_THEME="mrtazz"
#export ZSH_THEME="michelebologna"
#export ZSH_THEME="sorin"
#export ZSH_THEME="mh"
#export ZSH_THEME="terminalparty"
export ZSH_THEME="gitster"

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
plugins=(git extract laravel5)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

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
alias 's-s'='sudo su'
alias v='vim'
alias cls='clear'
alias top='htop -u $USER'
alias more='less'
alias freemem='echo 3 > /proc/sys/vm/drop_caches'
alias tmux='tmux -2'
alias ohmyzsh="mate ~/.oh-my-zsh"
alias td='tmux detach-client'
alias tl='tmux list-sessions'
alias  tda='td && ta'
alias git-delete-lock='rm -f .git/index.lock'
alias sus='sudo su'

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

function test_disc_speed() {
    s=${1:-1600}
    dd if=/dev/zero of=speedtest bs=64k count="$s" conv=fdatasync; 
    dd if=speedtest of=/dev/null; 
    rm -f speedtest
}
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

export GCC_COLORS="1"
export REPORTTIME=30

function precmd() {
  # set the title of terminal
  print -Pn "\e]0;%n@%m: %~\a"

  # Proceed only if we've ran a command in the current shell.
  if ! [[ -z $CMD_START_DATE ]]; then
      # Note current date in unix time
      CMD_END_DATE=$(date +%s)
      # Store the difference between the last command start date vs. current date.
      CMD_ELAPSED_TIME=$(($CMD_END_DATE - $CMD_START_DATE))
      # Store an arbitrary threshold, in seconds.
      CMD_NOTIFY_THRESHOLD=$REPORTTIME

      if [[ $CMD_ELAPSED_TIME -gt $CMD_NOTIFY_THRESHOLD ]]; then
          # Beep or visual bell if the elapsed time (in seconds) is greater than threshold
          print -n '\a'
          # Send a notification
          if type notify-send &> /dev/null; then
            notify-send 'Job finished' "\"$CMD_NAME\" finished in $CMD_ELAPSED_TIME seconds."
          fi
      fi
  fi
  
}

function preexec () {
    # Note the date when the command started, in unix time.
    CMD_START_DATE=$(date +%s)
    # Store the command that we're running.
    CMD_NAME=$1
}


