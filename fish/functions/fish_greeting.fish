function fish_greeting
	set -l line1 (_ 'We trust you have received the usual lecture from the local System Administrator. It usually boils down to these three things:')
	set -l line2 \n(printf (_ '	#1) Respect the %sprivacy%s of others.') (set_color red) (set_color normal))
	set -l line3 \n(printf (_ '	#2) %sThink%s before you type.') (set_color red) (set_color normal))
	set -l line4 \n(printf (_ '	#3) With great power comes great %sresponsibility%s.') (set_color red) (set_color normal))
	set -g fish_greeting "$line1$line2$line3$line4"

	test -n "$fish_greeting"
	and echo $fish_greeting

end
