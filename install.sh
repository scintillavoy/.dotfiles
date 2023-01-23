#!/usr/bin/env bash

ask() {
  while true; do
    read -p "$1 ([y]/n) " -r
    REPLY=${REPLY:-"y"}
    if [[ $REPLY =~ ^[Yy]$ ]]; then
      return 1
    elif [[ $REPLY =~ ^[Nn]$ ]]; then
      return 0
    fi
  done
}

ask "Do you want to copy dotfiles?"
copy_dotfiles=$?

ask "Do you want to apply patches?"
apply_patches=$?

# Copy dotfiles
if [ $copy_dotfiles -eq 1 ]; then
  files=(.zshrc .vimrc)
  for file in ${files[@]}; do
    if [ -f "$HOME/$file" ]; then
      mv $HOME/$file $HOME/$file.bak
    fi
    cp ./$file $HOME/$file
  done
fi

# Apply patches
if [ $apply_patches -eq 1 ]; then
  file=$(brew --prefix fzf)/shell/key-bindings.zsh
  if [ -f $file ]; then
    patch -b $file ./fzf/shell/key-bindings.patch
  fi
fi
