SHELL 	:= /bin/bash
PROJECT  = dotfiles
DATE     = $(shell date +%D)

VERBOSE  = 0
FILTER 	 = $(if $(filter 1,${VERBOSE}),,@)

.PHONY: all run install update

all: help

install: ## install dotfiles handler
	${FILTER} if ! hash dotfiles 2>/dev/null; then\
	    sudo cp dotfiles /usr/local/bin/;\
	    sudo cp dotfiles_prompt /etc/bash_completion.d/;\
	    sudo chmod +x /usr/local/bin/dotfiles;\
	    sudo chmod +x /etc/bash_completion.d/dotfiles_prompt;\
	fi

run: install ## run dotfiles handler
	@./dotfiles

update: ## overwrite dotfiles install
	${FILTER} git pull
	${FILTER} sudo cp dotfiles /usr/local/bin/
	${FILTER} sudo cp dotfiles_prompt /etc/bash_completion.d/
	${FILTER} sudo chmod +x /usr/local/bin/dotfiles
	${FILTER} sudo chmod +x /etc/bash_completion.d/dotfiles_prompt

help: ## display this help screen
	@grep -h -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

