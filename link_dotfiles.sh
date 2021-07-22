#!/bin/bash

# Link and overwrite those in $HOME/ with these dotfiles
ln -sf $HOME/dotfiles/.zshrc		$HOME/.zshrc
ln -sf $HOME/dotfiles/.vimrc		$HOME/.vimrc
ln -sf $HOME/dotfiles/.nvmrc		$HOME/.nvmrc
ln -sf $HOME/dotfiles/.alias.sh	$HOME/.alias.sh
