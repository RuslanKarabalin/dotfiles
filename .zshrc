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
    printf '\e[1m%s\e[0m\n' "$(date '+%Y-%m-%d %H:%M:%S') INFO sudo pacman -Syyyuuu"
    sudo pacman -Syyyuuu || return
    
    printf '\e[1m%s\e[0m\n' "$(date '+%Y-%m-%d %H:%M:%S') INFO yay -Syu"
    yay -Syu || return
    
    printf '\e[1m%s\e[0m\n' "$(date '+%Y-%m-%d %H:%M:%S') INFO flatpak update -y"
    flatpak update -y || return

    local -a orphans
    orphans=($(yay -Qdtq))
    if (( ${#orphans} )); then
        printf '\e[1m%s\e[0m\n' "$(date '+%Y-%m-%d %H:%M:%S') INFO yay -Rsn -- \"${orphans[@]}\""
        yay -Rsn -- "${orphans[@]}"
    else
        printf '\e[1m%s\e[0m\n' "$(date '+%Y-%m-%d %H:%M:%S') INFO No orphan packages to remove"
    fi
}
