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
	@sudo apt install conky -y
	@cp conkyrc $(CONKY_PATH)
	@$(PYTHON) ./src/startup_app.py conky /usr/bin/conky
	@echo "PLEASE RESTART YOUR SYSTEM FOR CHANGES TO TAKE EFFECT!"

.PHONY: help verify install
