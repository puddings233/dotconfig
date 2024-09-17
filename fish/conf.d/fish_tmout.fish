function start_logout_timer --on-event fish_prompt
	# Allows $last_pid to work in a function
	status job-control full
	if set --query __fish_tmout_pid
		# Stop previous timer
		kill -- -$__fish_tmout_pid
	end
	# Start new timer
	FISH_PID=%self sh -c "sleep 60; kill -HUP $FISH_PID" &
	# Allows logout without warning of background jobs
	disown
	set -gx __fish_tmout_pid $last_pid
end

function stop_logout_timer --on-event fish_preexec
	if set --query __fish_tmout_pid
		kill -- -$__fish_tmout_pid
	end
	set --erase __fish_tmout_pid
end
