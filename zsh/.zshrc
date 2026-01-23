# welcome
echo "We trust you have received the usual lecture from the local System Administrator. It usually boils down to these three things:"
echo "	#1) Respect the \e[1;31mprivacy\e[0m of others."
echo "	#2) \e[1;31mThink\e[0m before you type."
echo "	#3) With great power comes great \e[1;31mresponsibility\e[0m."

# editor
export EDITOR=nvim

# gpg & ssh
export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye >/dev/null
export SSH_AGENT_PID=""
export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/gnupg/S.gpg-agent.ssh"

# rootless docker
export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/docker.sock

# alias
alias C="clear"
alias cp="cp --interactive"
alias mv="mv --interactive"

# yazi
function ra() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# Enable Powerlevel10k instant prompt.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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
ZVM_SYSTEM_CLIPBOARD_ENABLED=true
ZVM_LINE_INIT_MODE=$ZVM_MODE_NORMAL
function zvm_after_lazy_keybindings() {
	zvm_bindkey vicmd 'u' history-substring-search-up
	zvm_bindkey vicmd 'j' history-substring-search-down
	zvm_bindkey vicmd 'h' vi-backward-char
	zvm_bindkey vicmd 'k' vi-forward-char
	zvm_bindkey visual 'h' vi-backward-char
	zvm_bindkey visual 'k' vi-forward-char

	#tab-completion menu keybindings
	zstyle ':completion:*' menu select
	zmodload zsh/complist
	zvm_bindkey menuselect 'u' vi-up-line-or-history
	zvm_bindkey menuselect 'j' vi-down-line-or-history
	zvm_bindkey menuselect 'h' vi-backward-char
	zvm_bindkey menuselect 'k' vi-forward-char

	zvm_bindkey vicmd 'LL' undo
	zvm_bindkey vicmd 'p' zvm_paste_clipboard_after
	zvm_bindkey vicmd 'P' zvm_paste_clipboard_before
	zvm_bindkey visual 'p' zvm_visual_paste_clipboard
	zvm_bindkey visual 'P' zvm_visual_paste_clipboard
}

# Disable automatic widget re-binding on each precmd. This can be set when
# zsh-users/zsh-autosuggestions is the last module in your ~/.zimrc.
ZSH_AUTOSUGGEST_MANUAL_REBIND=1

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
