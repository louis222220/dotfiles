#!/bin/bash

echo "cleanup unused dotfiles in ${HOME}"
RM_COMMAND='rm -v'
if ! command -v trash &> /dev/null
then
	RM_COMMAND='trash -v'
fi

$RM_COMMAND ~/.zcompdump* 2> /dev/null
$RM_COMMAND ~/.DS_Store 2> /dev/null

