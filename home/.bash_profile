# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$HOME/bin:$PATH

export PATH

# Load profile config
if [ -d /data/dotfiles/etc/profile.d ]; then
    for i in /data/dotfiles/etc/profile.d/*.sh; do
        if [ -r "$i" ]; then
            if [ "$PS1" ]; then
                source "$i"
            else
                source "$i" >/dev/null
            fi
        fi
    done
    unset i
fi
