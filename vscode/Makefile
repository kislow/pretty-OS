BASH = /bin/bash
CONKY_PATH = $(HOME)/.conkyrc
CONKY_AUTOSTART = $(HOME)/.config/autostart

# Show this help.
help: ## Show this help.
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

verify: ## verify desktop environment
	@echo 'desktop environment in use:'
	@ps -e | grep -E -i "xfce|kde|gnome"

install: ## Installing vscode and its extensions
	@echo "Installing VSCode izzo extensions, sudo rights required!"
	@$(BASH) ./src/install_vscode_izzo.sh
	@echo "PLEASE RESTART YOUR SYSTEM FOR CHANGES TO TAKE EFFECT!"

.PHONY: help verify install
