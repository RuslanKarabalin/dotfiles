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
    omz update

    brew update &&
    brew upgrade --greedy &&
    brew autoremove &&
    brew cleanup --prune=all -s &&
    brew doctor
}

aupc() {
    aup
    
    claude update
}
