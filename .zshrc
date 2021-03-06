# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=/home/boos3y/.oh-my-zsh
  export PATH=$PATH:/snap/bin

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

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
plugins=(git docker pyenv tmuxinator zsh-autosuggestions safe-paste colored-man-pages docker-compose asdf)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"
export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export TERM=xterm-256color
export EDITOR=vim
export SHELL zsh

setopt no_share_history
# Add local path to path
export PATH=/usr/local/go/bin:~/.local/bin:$PATH

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
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias fig='docker-compose'
alias fuck='sudo $(fc -ln -1)'
alias delpyc="sudo find . -name '*.pyc' -delete"
alias mux='tmuxp'
alias ku="kubectl"
alias dc='docker-compose'
alias skyvpn='sudo openvpn --config ~/.vpn/client.ovpn'
alias kudown='kubectl get pods --all-namespaces | grep -v Running'
alias ek="eksctl"
alias release="git log --pretty=format:'* %s' --reverse \`git describe --tags --abbrev=0\`..HEAD"
kurestart () { ku get pods "$@" -o yaml | ku replace --force -f -}
uwsgitop () { ku exec -it "$@" uwsgitop localhost:5050}
export DISABLE_AUTO_TITLE='true'


# VIM BASH SETTINGS?
#bindkey -v
#bindkey 'jj' vi-cmd-mode
#bindkey '^j' beginning-of-line
#bindkey '^l' end-of-line
#
#Turn off auto cd
unsetopt AUTO_CD
export PATH=$PATH:/home/boos3y/bin/slack-theme
export SLACK_THEME_SHELL_PROFILE="/home/boos3y/.zshrc"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/terraform terraform
. $HOME/.asdf/asdf.sh

if [ -f ~/.env_file ]; then
    source ~/.env_file
else
    print "~/.env_file not found."
fi

