# SectlyOS bash enhancements -- sourced for all interactive bash sessions

# Default terminal editor
export EDITOR=nano
export VISUAL=nano

# Starship prompt
if command -v starship &>/dev/null; then
    eval "$(starship init bash)"
fi

# fzf key bindings and completion
if [ -f /usr/share/fzf/shell/key-bindings.bash ]; then
    source /usr/share/fzf/shell/key-bindings.bash
fi
if [ -f /usr/share/bash-completion/completions/fzf ]; then
    source /usr/share/bash-completion/completions/fzf
fi

# Handy aliases
alias ll='ls -lh'
alias la='ls -lah'
alias grep='grep --color=auto'
