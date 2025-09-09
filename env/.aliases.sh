# alias vim="~/documents/nvim-linux-x86_64/bin/nvim"
alias vim="nvim"
alias cim="nvim -u ~/.config/nvim/min-init.lua"

alias def="~/personal"

alias ff="fastfetch"

alias chat="nvim ~/documents/chat.md"
alias zxcv="nvim ~/documents/zxcv.md"
alias fair="nvim ~/documents/notes/todo.md"

alias ls="eza -a1 -s type"

alias e="exit"
alias q="exit"
alias s="cd"
alias r="ranger"
alias ..="cd .."
alias rel="omz reload"

alias rin="tmux-sessionizer $WORKSTATION"
alias whore="tmux-sessionizer $HOME"
alias why="tmux-sessionizer $HOME/documents"

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

psk() {
    for str in "$@"; do
        printf "%-15s %.2f GB\n" "$str" "$(ps -o rss= -p $(pgrep $str) | awk '{s+=$1} END {print s / (1024*1024)}')"
    done
}

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

y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
    yazi "$@" --cwd-file="$tmp"

    IFS= read -r -d '' cwd <"$tmp"
    [ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && tmux -- "$cwd"
    rm -f -- "$tmp"
}
