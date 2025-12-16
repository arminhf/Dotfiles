alias mv='mv -v'
alias rm='rm -v'
alias mkdir='mkdir -v'
alias rmdir='rmdir -v'

alias ls="eza --all --across --group-directories-first --icons=auto --hyperlink"

# cat
alias cat='bat --paging=never'

# help
alias bathelp='bat --plain --language=help'
help() {
    "$@" --help 2>&1 | bathelp
}
alias -g -- -h='-h 2>&1 | bat --language=help --style=plain'
alias -g -- --help='--help 2>&1 | bat --language=help --style=plain'

# man
eval "$(batman --export-env)"
# kitty image
alias icat="kitten icat"
# nvim
alias v="nvim"
alias vi="nvim"
alias vim="nvim"
alias lv="NVIM_APPNAME=lazyvim nvim"

# yazi
function y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
    yazi "$@" --cwd-file="$tmp"
    IFS= read -r -d '' cwd <"$tmp"
    [ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
    \rm -f -- "$tmp"
}
# zoxide
eval "$(zoxide init --cmd cd zsh)"
