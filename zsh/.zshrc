# Aliases
alias ls='lsd'
alias ll='lsd -lah'
alias lt='lsd --tree'
alias grep='grep --color=auto'

# Editor
export EDITOR=nano
export VISUAL=$EDITOR

# Oh My Posh
eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/nebula-surge.omp.json)"

# fzf shell integration (Ctrl+R, Ctrl+T, Alt+C)
eval "$(fzf --zsh)"
export FZF_CTRL_T_COMMAND='fd --type f --hidden --exclude .git'
export FZF_ALT_C_COMMAND='fd --type d --hidden --exclude .git'
