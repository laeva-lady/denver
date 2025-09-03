# alias vim="~/documents/nvim-linux-x86_64/bin/nvim"
alias vim="nvim"
alias cim="nvim -u ~/.config/nvim/min-init.lua"

alias def="~/personal"

alias ff="fastfetch"

alias chat="nvim ~/documents/chat.md"
alias zxcv="nvim ~/documents/zxcv.md"
alias fair="nvim ~/documents/notes/todo.md"

# listing
alias ls="eza -a1 -s type"

# lazy ass bum
alias e="exit"
alias s="cd"
alias r="ranger"
alias ..="cd .."
alias rel="omz reload"

alias rin="tmux-sessionizer $WORKSTATION"
alias not="tmux-sessionizer $HOME/documents/notes/"
alias whore="tmux-sessionizer $HOME"
alias why="tmux-sessionizer $HOME/documents"

# ok you lazy as fuck mf
alias g="git"
alias gs="git status"
alias ga="git add ."
alias gd="git diff"
alias gc="git commit"
alias gcm="git commit -m"
alias gac="git commit -a"
alias gacm="git commit -am"
alias gpush="git push"
alias gpull="git pull"

t() {
    if [ -z "$1" ]; then
        tmux-sessionizer $(pwd)
    else
        tmux-sessionizer "$(realpath $1)"
    fi
}
complete -o dirnames t
tl() {
    tmux list-sessions
}

cursor() {
    command cursor --enable-features=UseOzonePlatform --ozone-platform=wayland "$@" >/dev/null 2>&1 &
}

battery() {
    upower -i /org/freedesktop/UPower/devices/battery_BAT0 |
        awk '/state:/ { s=$2 } /percentage:/ { p=$2 } END { print p " (" s ")" }'
}

dfz() {
    local dir
    dir=$(find ~/personal/ ~/devep -type d | fzf) || return
    [ -n "$dir" ] && cd "$dir"
}

y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
    yazi "$@" --cwd-file="$tmp"

    IFS= read -r -d '' cwd <"$tmp"
    [ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && tmux -- "$cwd"
    rm -f -- "$tmp"
}
