alias c='clear'
alias env='env | sort'
alias fp='fixPerms'

# Git aliases
alias gb='git branch'
alias gba='git branch -a'
alias gc='git commit'
alias gl='git log --oneline'
alias gs='git status'
alias gup='git checkout develop && git pull origin develop && git fetch origin --prune'

alias ls='ls -G'
alias sandbox='cd ~/Sandbox'
alias work='cd ~/Workspace'

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

# override os x's default vi and use homebrew's version of macvim
function vim(){
    mvim "$@" ;
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
