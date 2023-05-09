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

ask "Do you want to generate shell completion setup scripts?"
generate_completions=$?

ask "Do you want to apply patches?"
apply_patches=$?

# Copy dotfiles.
if [ $copy_dotfiles -eq 1 ]; then
  files=(.gitconfig .vimrc .zshrc .p10k.zsh)
  for file in ${files[@]}; do
    if [ -f "$HOME/$file" ]; then
      mv $HOME/$file $HOME/$file.bak
    fi
    cp ./$file $HOME/$file
  done
fi

# Generate shell completion setup scripts.
if [ $generate_completions -eq 1 ]; then
  file=.completions.zsh
  if [ -f "$HOME/$file" ]; then
    mv $HOME/$file $HOME/$file.bak
  fi

  cmds=("flutter bash-completion" "kubectl completion zsh")
  for cmd in "${cmds[@]}"; do
    if command -v $cmd &> /dev/null; then
      eval $cmd >> $HOME/$file
    fi
  done
fi

# Apply patches.
if [ $apply_patches -eq 1 ]; then
  file=$(brew --prefix fzf)/shell/key-bindings.zsh
  if [ -f $file ]; then
    patch -b $file ./fzf/shell/key-bindings.patch
  fi
fi
