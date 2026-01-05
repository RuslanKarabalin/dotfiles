# omz
export ZSH="$HOME/.oh-my-zsh"

# zsh theme
ZSH_THEME="robbyrussell"

# plugins
plugins=(
    git
    tmux
    rust
    golang
    archlinux
    zsh-autosuggestions
)

# zsh initialize script
source $ZSH/oh-my-zsh.sh

# PATH additions
export PATH="$PATH:$HOME/go/bin"
export PATH="$PATH:$HOME/.local/bin"

# custom aliases
alias aup="yay -Syyyuuu && yay -Rsn $(yay -Qdtq)"

alias swu="sudo wg-quick up karpn"
alias swd="sudo wg-quick down karpn"
