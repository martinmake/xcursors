DIRECTORY_ROOT:=$(realpath .)

include Makefile.conf

THEMES:=$(shell ls $(DIRECTORY_SOURCE))

.PHONY: all
all: $(THEMES) ## builds all themes

.PHONY: install
install: ## installs all built themes into ~/.icons/
	cp -r $(DIRECTORY_BUILD)/* ~/.icons

%:
	mkdir -p $(DIRECTORY_BUILD)/$@/cursors
	cd $(DIRECTORY_SOURCE)/$@; $(foreach config,$(shell ls $(DIRECTORY_SOURCE)/$@/config),xcursorgen ./config/$(config) $(DIRECTORY_BUILD)/$@/cursors/$(config);)
	$(DIRECTORY_SCRIPT)/symlink.sh $(DIRECTORY_SOURCE)/$@/symlinks $(DIRECTORY_BUILD)/$@/cursors
	echo -n > $(DIRECTORY_BUILD)/$@/index.theme
	echo '[Icon Theme]' >> $(DIRECTORY_BUILD)/$@/index.theme
	echo "Name=$@" >> $(DIRECTORY_BUILD)/$@/index.theme

clean: ## remove all built files
	rm -R $(DIRECTORY_BUILD)

.PHONY:help
help: ## lists documented targets
	@grep -Eh '^[0-9a-zA-Z_-$$()]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
	@echo $(THEMES) | awk 'BEGIN {FS = " "}; {printf "\033[36m%-20s\033[0m theme\n", $$1}'
