export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(
    git
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

export PATH="$PATH:$HOME/go/bin"
export PATH="$PATH:$HOME/.local/bin"

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

log() {
    printf '\e[1m%s\e[0m\n' "$(date '+%Y-%m-%d %H:%M:%S') INFO $*"
}

aup() {
    log "Updating oh my zsh"
    omz update ||
    return

    log "Updating brew packages"
    brew update &&
    brew upgrade --greedy &&
    brew autoremove &&
    brew cleanup --prune=all -s &&
    brew doctor ||
    return
}

aupc() {
    aup
    
    log "Updating claude"
    claude update &&
    claude doctor ||
    return
}
