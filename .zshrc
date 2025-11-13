# omz
export ZSH="$HOME/.oh-my-zsh"

# zsh theme
ZSH_THEME="robbyrussell"

# plugins
plugins=(
    git
    mvn
    pip
    npm
    tmux
    golang
    gradle
    ubuntu
    zsh-autosuggestions
)

# zsh initialize script
source $ZSH/oh-my-zsh.sh

# PATH additions
export PATH="$PATH:$HOME/go/bin/"
export PATH="$PATH:$HOME/.cargo/bin/"
export PATH="$PATH:/home/ruska/.local/bin/"

# custom aliases
alias swu="sudo wg-quick up karpn"
alias swd="sudo wg-quick down karpn"

alias sau="
    sudo apt -y update
    sudo apt -y upgrade
    sudo apt -y autoremove
    sudo apt -y autoclean
    sudo apt -y clean all
    sudo snap refresh
    snap refresh --list
    sudo npm update -y 
    omz update
"
