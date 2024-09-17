if status is-interactive
	# Commands to run in interactive sessions can go here
	fenv source /etc/profile
	set -gx EDITOR nvim
	set -x GPG_TTY (tty)
	set -e SSH_AGENT_PID
	set -gx SSH_AUTH_SOCK $XDG_RUNTIME_DIR/gnupg/S.gpg-agent.ssh
	set -gx fish_cursor_insert line
	fish_vi_key_bindings
	set fish_key_bindings fish_user_key_bindings
	source ~/.config/fish/functions/alias.fish
end
