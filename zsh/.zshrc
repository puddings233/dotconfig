# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# editor
export EDITOR=nvim

# gpg & ssh
export GPG_TTY=$(tty)
export SSH_AGENT_PID=""
export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/gnupg/S.gpg-agent.ssh"

# rootless docker
export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/docker.sock

# fuck(need package "thefuck")
eval $(thefuck --alias)

# default config
HISTFILE=~/.config/zsh/.zsh_history
HISTSIZE=5000
SAVEHIST=5000
setopt beep nomatch notify CORRECT HIST_IGNORE_ALL_DUPS
# spelling correction prompt.
SPROMPT='Correct: %F{red}%R%f -> %F{green}%r%f [%F{blue}n%fo, %F{blue}y%fes, %F{blue}a%fnnul, %F{blue}e%fdit]? '
# remove path separator from WORDCHARS.
WORDCHARS=${WORDCHARS//[\/]}

# initialize modules
ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim
# download zimfw plugin manager if missing.
if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
  if (( ${+commands[curl]} )); then
    curl -fsSL --create-dirs -o ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  else
    mkdir -p ${ZIM_HOME} && wget -nv -O ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  fi
fi
# install missing modules, and update ${ZIM_HOME}/init.zsh if missing or outdated.
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZIM_CONFIG_FILE:-${ZDOTDIR:-${HOME}}/.zimrc} ]]; then
  source ${ZIM_HOME}/zimfw.zsh init
fi
# initialize modules.
source ${ZIM_HOME}/init.zsh

# post-init module configuration

#
# zsh-history-substring-search
#

zmodload -F zsh/terminfo +p:terminfo

# vi mode keybindings
# the plugin will auto execute this zvm_after_lazy_keybindings function.
function zvm_after_lazy_keybindings() {
	zvm_bindkey vicmd 'u' history-substring-search-up
	zvm_bindkey vicmd 'j' history-substring-search-down
	zvm_bindkey vicmd 'h' vi-backward-char
	zvm_bindkey vicmd 'k' vi-forward-char
}


# Disable automatic widget re-binding on each precmd. This can be set when
# zsh-users/zsh-autosuggestions is the last module in your ~/.zimrc.
ZSH_AUTOSUGGEST_MANUAL_REBIND=1

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
