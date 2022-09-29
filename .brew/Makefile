
default:
	# make install, to install softwares by Brewfile
	# make backup, to dump Brewfile to ${HOME}/dotfiles/.brew/

install:
	# Install softwares by Brewfile
	brew bundle install

backup:
	# Dump Brewfile to ${HOME}/.brew/
	brew bundle dump --describe --force --file="${HOME}/dotfiles/.brew/Brewfile"

