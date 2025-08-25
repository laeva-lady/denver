export ZSH="$HOME/.oh-my-zsh"

export GEM_HOME="$HOME/.local/share/gem/ruby/3.4.0"
export PATH="$GEM_HOME/bin:$PATH"
export PATH="$HOME/.cabal/bin:$PATH"
export PATH="$HOME/.config/emacs/bin:$PATH"
export PATH="$HOME/.ghcup/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/documents/scripts:$PATH"

export WORKSTATION="$HOME/denver"



ZSH_THEME="robbyrussell"

plugins=(
    git
    fzf-tab
    battery
)

source $ZSH/oh-my-zsh.sh

[ -f ~/.aliases.sh ] && source ~/.aliases.sh

export EDITOR="nvim"
export VISUAL="$EDITOR"

autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:git:*' formats ' %F{cyan}[%f%F{red}%b%f%F{cyan}]%f'

setopt PROMPT_SUBST
PROMPT='%(?.%F{green}>.%F{red}>)%f %F{cyan}[%f%F{blue}%~%f%F{cyan}]%f${vcs_info_msg_0_} %F{yellow};%f '
# RPROMPT='%F{8} %* $(battery)%% %f'

[[ ! -r '/home/kate/.opam/opam-init/init.zsh' ]] || source '/home/kate/.opam/opam-init/init.zsh' > /dev/null 2> /dev/null

bindkey -s ^t "^utmux-sessionizer\n"
bindkey -s ^y "^uyazi-tmux\n"
bindkey -s ^k "^udfz\n"
bindkey -s ^f "^uvfz\n"
bindkey -s ^e "^ucode .\n"
bindkey -s ^q "^ukitty sh -c ranger\n"


[ -f "/home/kate/.ghcup/env" ] && . "/home/kate/.ghcup/env" # ghcup-env
eval $(thefuck --alias)
