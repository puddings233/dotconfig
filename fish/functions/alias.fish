function C
	clear
end

function F
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end

function cat
	bat $argv
end

function cp
	/usr/bin/cp -i $argv
end

function mv
	/usr/bin/mv -i $argv
end
