#!/usr/bin/env bash

function start_rsync() {
    watchdog "start rsync home directory"
    rsync \
        --exclude ".git/" \
        --exclude ".DS_Store" \
        --exclude "README.md" \
        --exclude "LICENSE.txt" \
        -avh\
        --no-perms ./home/ ~/;
    if [[ "$?" -ne 0 ]]; then
        watchdog "rsync failure" ERROR
        exit 1
    else
        watchdog "rsync success" SUCC
    fi
    source ~/.bash_profile
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
    start_rsync
else
    read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
    echo ""
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        start_rsync
    fi
fi
unset start_rsync
