alias ls="ls -ACHG --color $*"
# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias mkdir="mkdir -pv"

alias mycode="cd ~/code"
alias gotocode="cd ~/code"

alias bashrc="code ~/.bashrc"
alias aliases="code $ALIAS_DIR/.bash_aliases"
alias poshtheme="code $POSH_THEME"

alias gw="./gradlew $*"
alias gboot="./gradlew bootRun"

alias nsl="npm run start-local"
alias ns="npm run start"

alias dockerkill="docker kill $(docker ps -q)"

alias startkmonad="bash $KMONAD_DIR/kmonad-startup.sh &"

awsSetup() {
    export AWS_PROFILE=$1
    export AWS_REGION=us-east-1
    export NODE_ENV=localhost
    echo AWS_PROFILE=$AWS_PROFILE
    echo AWS_REGION=$AWS_REGION
    echo NODE_ENV=$NODE_ENV
    aws sts get-caller-identity
}

localstack() {
    awsSetup localstack
}

qualhost() {
    awsSetup qual
}

alias gc="git commit -m $*"

gitDeleteAllLocalButCurrent() {
    currentBranch=$(git branch --show-current)
    echo "Deleting all branches but $currentBranch"
    git branch | grep -v "$currentBranch" | xargs git branch -D
}

github() {
    tempurl=$(git remote get-url ${1:-origin})
    tempurl=$(echo $tempurl | sed "s/git@/https:\/\//" )
    tempurl=$(echo $tempurl | sed "s/.com:/.com\//" )
    echo Opening $tempurl...
    xdg-open $tempurl
}

gitrap(){
    git branch -m $1
    git push -u origin $1
}

gitSetup(){
    git config user.name "Grey Lovelace"
    git config user.email $1
}

realmaster() {
    git fetch real master
    git checkout real/master -b master
}