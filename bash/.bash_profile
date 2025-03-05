# include .bashrc
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# enable local python env
source ~/.local/env/bin/activate

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
echo \"$PS1\"
PS1="${PS1/\\$ /}\033[31m\]\$(parse_git_branch)\[\033[00m\]\$ "
