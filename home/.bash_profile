# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

PATH=$HOME/bin:$PATH
if [ -d ~/dotfiles/bin ];then
    PATH=~/dotfiles/bin:$PATH
fi
export PATH

# Load profile config
if [ -d ~/dotfiles/etc/profile.d ]; then
    for i in ~/dotfiles/etc/profile.d/*.sh; do
        if [ -r "$i" ]; then
            if [ "$PS1" ]; then
                source "$i"
            else
		echo $i
                source "$i" >/dev/null
            fi
        fi
    done
    unset i
fi
