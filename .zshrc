eval "$(starship init zsh)"
export EDITOR=nvim
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

# Created by `pipx` on 2023-11-14 15:04:39
export PATH="$PATH:/Users/filipmilosevic/.local/bin"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH=$PATH:/Users/filipmilosevic/.spicetify

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Add Python to PATH
eval "$(pyenv init --path)"

alias tat="tmux attach -t"
alias t="tmux"
