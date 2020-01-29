#!/usr/bin/env bash

##### 🖥
# Pickle Laptop
# Sets up a new laptop with a basic development environment
#
# All Rights Reserved. Copyright 2020 JESSICA JEAN JOSEPH ©
#
# Updated: January 28th, 2019
# Created: January 27th, 2019
##### 🖥

main() {
	spacer
	spacer
	echo "⚡️ STARTING UP THE PICKLE POTATO MACHINE"
	spacer
	spacer
	
	echo ""
	echo "⚡️ Configuring Computer Files ⚡️"

	echo "⚡️ BASH PROFILE ⚡️"
	sudo touch "$HOME"/.bash_profile
	sudo cp ./bash_profile/.bash_profile "$HOME"/.bash_profile

	echo "⚡️ ZSHRC ⚡️"
	sudo touch $HOME/.zshrc
	sudo cp ./bash_profile/.zshrc $HOME/.zshrc

        compl_process "Configuring Computer Files"

    	echo ""
	echo "⚡️ Beginning Install Scripts ⚡️"
	chmod 755 scripts/*

	exec_from_scripts homebrew.sh
	exec_from_scripts vapor.sh
	exec_from_scripts git.sh
	exec_from_scripts nvm.sh
	exec_from_scripts node.sh
	exec_from_scripts angular.sh

        compl_process "Installing Script Libraries"

        compl_process "PICKLE POTATO MACHINE"
}


## Supporting Methods
compl_process() {
	COMPL_MESSAGE=$1	

	echo "======= DONE: $COMPL_MESSAGE  ======="
	spacer
	spacer
}

exec_from_scripts() {
	SCRIPT_NAME=$1

	spacer
	./scripts/"$SCRIPT_NAME"
}

spacer() {
	echo "⚡️⚡️⚡️⚡️⚡️⚡️⚡️🥔🥔🥔🥔🥔🥔🥔🥔🥔🥔🥔🥔🥔🥔🥔🥔🥔🥔🥔🥔🥔⚡️⚡️⚡️⚡️⚡️⚡️⚡️"
}

main "$@"
