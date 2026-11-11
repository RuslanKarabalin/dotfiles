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
export PATH="$PATH:$HOME/.docker/bin"

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

export PATH="$PATH:$HOME/Library/Application Support/JetBrains/Toolbox/scripts"

aup() {
    omz update

    brew update
    brew upgrade --greedy
    brew autoremove
    brew cleanup --prune=all -s
    brew doctor
    claude update
    rustup update
}

eval "$(mise activate zsh)"

eval "$(/opt/homebrew/bin/brew shellenv zsh)"
