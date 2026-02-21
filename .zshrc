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
    printf '\e[1m%s\e[0m\n' "$(date '+%Y-%m-%d %H:%M:%S') INFO Updating oh my zsh"
    omz update || return

    printf '\e[1m%s\e[0m\n' "$(date '+%Y-%m-%d %H:%M:%S') INFO Updating brew packages"
    brew update && brew upgrade --greedy && brew autoremove && brew cleanup --prune=all -s && brew doctor || return
}
