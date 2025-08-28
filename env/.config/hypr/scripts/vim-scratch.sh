#!/usr/bin/bash

# kitty --class="kittynvimscratch" nvim $HOME/personal/zxcv.md
#
if [ "$1" == "zxcv" ]; then
    kitty nvim $HOME/documents/zxcv.md
else
    if [ "$1" == "faire" ]; then
        kitty nvim $HOME/documents/notes/todo.md
    fi
fi
