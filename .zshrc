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
    docker
    archlinux
    zsh-autosuggestions
)

# zsh initialize script
source $ZSH/oh-my-zsh.sh

# PATH additions
export PATH="$PATH:$HOME/go/bin"
export PATH="$PATH:$HOME/.local/bin"

# custom aliases
aup() {
    sudo pacman -Syyyuuu || return
    yay -Syu || return
    local -a orphans
    orphans=($(yay -Qdtq))
    if (( ${#orphans} )); then
        yay -Rsn -- "${orphans[@]}"
    else
        printf '\e[1m%s\e[0m\n' ":: No orphan packages to remove..."
    fi
}
