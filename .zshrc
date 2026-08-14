export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(
    git
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

export PATH="$PATH:$HOME/go/bin"
export PATH="$PATH:$HOME/.local/bin"

aup() {
    printf "Updating oh my zsh"
    omz update

    printf "Updating brew packages"
    brew update &&
    brew upgrade --greedy &&
    brew autoremove &&
    brew cleanup --prune=all -s &&
    brew doctor
}

aupc() {
    aup
    
    printf "Updating claude"
    claude update
}
