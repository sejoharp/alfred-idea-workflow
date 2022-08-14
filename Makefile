.DEFAULT_GOAL:= help

.PHONY: package
package: ## creates alfred workflow binary
	cd workflow && zip -r idea.alfredworkflow icon.png info.plist

.PHONY: install 
install: package ## builds and installs workflow in alfred
	open workflow/idea.alfredworkflow

.PHONY: help	
help: ## shows help message
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m\033[0m\n"} /^[$$()% a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)