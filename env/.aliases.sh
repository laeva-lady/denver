alias vim="nvim"
alias cim="nvim -u ~/.config/nvim/min-init.lua"

alias def="~/personal"

alias ff="fastfetch"

alias chat="nvim ~/personal/chat.md"
alias zxcv="nvim ~/personal/zxcv.md"
alias fair="nvim ~/personal/notes/todo.md"

# listing
alias ls="eza -a1 -s type"

# lazy ass bum
alias e="exit"
alias s="cd"
alias r="ranger"
alias ..="cd .."
alias rel="omz reload"

alias rin="tmux-sessionizer $WORKSTATION"
alias not="tmux-sessionizer $HOME/personal/notes/"
alias whore="tmux-sessionizer $HOME"
alias why="tmux-sessionizer $HOME/personal"

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
    tmux-sessionizer $(pwd)
}

cursor() {
    command cursor --enable-features=UseOzonePlatform --ozone-platform=wayland "$@" >/dev/null 2>&1 &
}

battery() {
    upower -i /org/freedesktop/UPower/devices/battery_BAT0 | awk '/percentage:/ { print $2 }'
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
