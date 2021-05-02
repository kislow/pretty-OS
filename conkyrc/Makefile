PYTHON = /usr/bin/python3
CONKY_PATH = $(HOME)/.conkyrc

# Show this help.
help: ## Show this help.
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

verify: ## verify desktop environment
	@echo 'desktop environment in use:'
	@ps -e | grep -E -i "xfce|kde|gnome"

install: ## Installing conky
	@echo "Installing conky, sudo rights required!"
	@sudo apt update && sudo apt install conky -y
	@cp conkyrc $(CONKY_PATH)
	@$(PYTHON) ./src/startup_app.py conky /usr/bin/conky
	@echo "PLEASE RESTART YOUR SYSTEM FOR CHANGES TO TAKE EFFECT!"

remove: ## remove conky
	@echo "Removing conky"
	@sudo apt remove conky -y && sudo apt autoremove -y && rm $(CONKY_PATH)
	@echo "PLEASE RESTART YOUR SYSTEM FOR CHANGES TO TAKE EFFECT!"


.PHONY: help verify install remove
