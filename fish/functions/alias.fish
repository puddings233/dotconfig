function C
	clear
end

function E
	neovide $argv
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
