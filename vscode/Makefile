BASH = /bin/bash

# Show this help.
help: ## Show this help.
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

verify: ## verify desktop environment
	@echo 'desktop environment in use:'
	@ps -e | grep -E -i "xfce|kde|gnome"

install: ## Installing vscode and its extensions
	@echo "Installing VSCode izzo extensions, sudo rights required!"
	@$(BASH) ./src/install_theme.sh
	@echo "YOU MAY NEED TO RESTART VSCODE FOR CHANGES TO TAKE EFFECT!"

remove: ## remove all vscode extensions
	@echo "Removing vscode extensions..."
	@rm -rf ~/.vscode/extensions
	@echo "VSCode extensions successfully removed!"

.PHONY: help verify install remove
