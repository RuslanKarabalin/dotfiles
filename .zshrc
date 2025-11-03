# omz
export ZSH="$HOME/.oh-my-zsh"

# zsh theme
ZSH_THEME="robbyrussell"

# plugins
plugins=(
    git
    mvn
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
export PATH="$PATH:/home/ruska/.local/bin"

# custom aliases
alias bat="batcat"
alias swu="sudo wg-quick up karpn"
alias swd="sudo wg-quick down karpn"
alias sau="
    sudo apt update     &&
    sudo apt upgrade    &&
    sudo apt autoremove &&
    sudo apt autoclean  &&
    sudo apt clean all  &&
    pipx upgrade-all
    npm update
    omz update
"
alias claude="/home/ruska/.claude/local/claude"
