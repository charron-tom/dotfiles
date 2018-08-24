# Environment Variables
export JENKINS_2_USER="thomas.charron@bitsighttech.com"
export JENKINS_2_KEY="793d29004d4a67c14fab6cfadc49ce2e"
export PATH="$HOME/.jenv/bin:$PATH"
export PATH="$HOME/virtualenvs/bskube/bin:$PATH"
export NVM_DIR="$HOME/.nvm"
export PYTHONDONTWRITEBYTECODE=1

# Bitsight aliases
alias portal="cd ~/Workspace/portal"

# Source
source /usr/local/bin/virtualenvwrapper.sh
source /Users/thomascharron/Workspace/bs-entity-manager/aliases.sh
source /Users/thomascharron/Workspace/infrav3/aliases.sh

#alias aws='aws --color on'
alias c='clear'
alias env='env | sort'
alias fp='fixPerms'

# Git aliases
alias gb='git branch'
alias gba='git branch -a'
alias gc='git commit'
alias gl='git log --oneline'
alias gs='git status'
alias gst='git status'
alias gup='git checkout develop && git pull origin develop && git fetch origin --prune'

alias ls='ls -G'
alias sandbox='cd ~/Sandbox'
alias work='cd ~/Workspace'


[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm


eval "$(jenv init -)"

# override os x's default vi and use homebrew's version of macvim
function vim() {
    mvim "$@" ;
}

function fixPerms () {
    echo " [x] Fixing the permissions for this folder and all its subfolders.";
    find . -type f -exec chmod 644 {} + && find . -type f -name "*.sh" -exec chmod 755 {} + && find . -type d -exec chmod 755 {} +
}

# Helper function to remove all .pyc files from the cwd
function cpyc () {
    find ${PWD} -name "*pyc" | xargs rm -rf 
}

function bs_pep8 { 
    (cd /usr/local/bitsight/portal; git diff -w master | pep8 --diff --max-line-length=100 | grep -v migrations $@);
}


function check_microservice(){
  curl -X GET http://$2.$1.bitsightlabs.com/health-status
}

function check_pos(){
  check_microservice "pdf-output-service" $1
}

function check_isopod(){
  check_microservice "isopod" $1
}

# tabtab source for yarn package
# uninstall by removing these lines or running `tabtab uninstall yarn`
[ -f /Users/thomascharron/.nvm/versions/node/v6.11.0/lib/node_modules/yarn-completions/node_modules/tabtab/.completions/yarn.bash ] && . /Users/thomascharron/.nvm
