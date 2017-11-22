# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/tcharron/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="bullet-train"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
#COMPLETION_WAITING_DOTS="true"

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
plugins=(git git-extras jira npm osx virtualenvwrapper web-search)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"
export ORACLE_HOME=/usr/local/oracle/instantclient_11_2
export NO_PROXY=localhost,127.0.0.1
export HTTP_PROXY=http://gatekeeper.mitre.org:80
export HTTPS_PROXY=$HTTP_PROXY

export JIRA_URL=https://jira.cit.mitre.org/
export JIRA_RAPID_BOARD=true
export JIRA_DEFAULT_ACTION=dashboard

function getSpotifyStatus {
    track=`spotify info | perl -n -e '/^Track:\s*([a-zA-z0-9\x27 \x27.\x27(\x27)\x27&]*)\s/ && print $1'`
    artist=`spotify info | perl -n -e '/^Artist:\s*([a-zA-z0-9\x27 \x27.\x27(\x27)]*)\s/ && print $1'`
    echo "$icon $artist - $track"
}

#export BULLETTRAIN_CUSTOM_MSG="\$(getSpotifyStatus)"
#export BULLETTRAIN_CUSTOM_BG=green
#export BULLETTRAIN_CUSTOM_FG=black

BULLETTRAIN_NVM_BG=yellow
BULLETTRAIN_NVM_FG=black

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

# Use macvim instead of vim
alias vim="mvim"

# Frequently used projects/places
alias akd='cd ~/Workspace/akd'
alias employeeshare='cd /Volumes/tcharron'
alias pp='cd ~/Workspace/projects'
alias qwf="cd ~/Workspace/qwf"
alias sandbox='cd ~/Sandbox'
alias work='cd ~/Workspace'

# SSH aliases
alias appdev1='ssh appdev1'
alias appint1='ssh appint1'
alias dvm='ssh dockervm'
alias tcappdev1='ssh tcappdev1'
alias tcappdev2='ssh tcappdev2'
alias tcappint1='ssh tcappint1'
alias tcappint2='ssh tcappint2'
alias tcharron='ssh tcharron'

# Docker logs
alias dpl='ssh docker'
alias dil='ssh docker-i'
alias ddl='ssh docker-d'

# Misc
alias c='clear'
alias env='env | sort'

unalias sp
alias sp='spotify'


function sync(){
    DIR_NAME="${PWD##*/}";
    rsync -azp --delete --filter=":- .gitignore" . "dockervm:/home/tcharron/${DIR_NAME}"
}

function fixPerms ()
{
    echo " [x] Fixing the permissions for this folder and all its subfolders.";
    find . -type f -exec chmod 644 {} + && find . -type f -name "*.sh" -exec chmod 755 {} + && find . -type d -exec chmod 755 {} +
}

# Helper function to move files I'm not quite sure I'm ready to delete
# But also don't want hanging around
function toss ()
{
    mv $@ ~/Desktop/.throwaway
}

# Helper function to remove all .pyc files from the cwd
function cpyc () 
{
    find ${PWD} -name "*pyc" | xargs rm -rf
}
