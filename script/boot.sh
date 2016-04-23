#!/usr/bin/env bash


################################
# Load Require File 
################################
load_require_file() 
{
    for i in lib/*; do
        if [ -r "$i" ]; then
            if [ "$PS1" ]; then
                . "$i"
            else
                . "$i" >/dev/null
            fi
        fi
    done
    unset i
}

load_require_file
