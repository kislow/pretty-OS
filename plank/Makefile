PYTHON = /usr/bin/python3
PLANK_DIR = $(HOME)/.config/plank
PLANK_AUTOSTART = $(HOME)/.config/autostart

# Show this help.
help: ## Show this help.
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

verify: ## verify desktop environment
	@echo 'desktop environment in use:'
	@ps -e | grep -E -i "xfce|kde|gnome"

install: ## Installing lightweight plank dock
	@echo "Installing plank dock, sudo rights required!"
	@sudo apt update && sudo apt install plank -y
	@$(PYTHON) ./src/startup_app.py plank /usr/bin/plank
	@echo "PLEASE RESTART YOUR SYSTEM FOR CHANGES TO TAKE EFFECT!"

remove: ## remove plank
	@echo "Removing plank"
	@sudo apt remove plank -y && sudo apt autoremove -y && rm -rf $(PLANK_DIR) && rm $(PLANK_AUTOSTART/plank.desktop)
	@echo "PLEASE RESTART YOUR SYSTEM FOR CHANGES TO TAKE EFFECT!"

.PHONY: help verify install remove
