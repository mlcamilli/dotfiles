# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=$HOME/.oh-my-zsh
  export PATH=$PATH:/snap/bin

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="dracula"

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
export FZF_DEFAULT_COMMAND="rg --files --hidden --follow --glob '!.git'"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# export TERM=xterm-256color
export EDITOR=nvim
export SHELL zsh

setopt no_share_history
# Add local path to path
export PATH=/usr/local/go/bin:~/.local/bin:$PATH

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    PROMPT='%F{red}[SSH] %f'$PROMPT
fi
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

alias fuck='sudo $(fc -ln -1)'
alias delpyc="sudo find . -name '*.pyc' -delete"
alias mux='tmuxp load'
alias ku="kubectl"
alias dc='docker compose'
alias dcr='docker compose run --rm'
alias docker-compose='docker compose'
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
export PATH=$PATH:$HOME/.asdf/installs/nodejs/14.5.0/.npm/bin/
export RIPGREP_CONFIG_PATH=~/.ripgreprc

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/terraform terraform

if [ -f ~/.asdf/asdf.sh ]; then
    . $HOME/.asdf/asdf.sh
fi

if [ -f ~/.env_file ]; then
    source ~/.env_file
fi

# Start Docker daemon automatically when logging in if not running.
if [ "$DOCKER_ENABLED" = "true" ]; then
    RUNNING=$(ps aux | grep dockerd | grep -v grep)
    if [ -z "$RUNNING" ]; then
        sudo dockerd > /dev/null 2>&1 &
        disown
    fi
fi
unsetopt PROMPT_SP

# pnpm
export PNPM_HOME="/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$HOME/$PNPM_HOME:$PATH" ;;
esac
# pnpm end
#
if [ -f ~/.local/bin/mise ]; then
    eval "$(~/.local/bin/mise activate zsh)"
fi
