export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(
    git
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

export PATH="$PATH:$HOME/go/bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.cargo/bin"

aup() {
    printf '\e[1m%s\e[0m\n' "$(date '+%Y-%m-%d %H:%M:%S') INFO omz update"
    omz update || return

    printf '\e[1m%s\e[0m\n' "$(date '+%Y-%m-%d %H:%M:%S') INFO brew update --force && brew upgrade && brew upgrade --cask && brew cleanup && brew doctor"
    brew update --force && brew upgrade && brew upgrade --cask && brew cleanup && brew doctor || return
}
