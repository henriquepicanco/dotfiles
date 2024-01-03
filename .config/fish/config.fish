if status is-interactive
	# Commands to run in interactive sessions can go here
	set -g fish_greeting
	fish_config theme choose "Catppuccin Mocha"
	fish_config prompt choose astronaut
end

if type -q exa
	alias ll "exa -l -g --icons"
	alias lla "ll -a"
end

#function fish_prompt
#	#printf '%s@%s %s%s%s' $USER $hostname (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
#	echo "$USER@$hostname [$(date +%T)] $(pwd)"
#	echo "\$ "
#end

starship init fish | source
