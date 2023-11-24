.PHONY brew_packages:
brew_packages:  # Brew packages with utilities and frameworks
	brew update
	brew upgrade
	brew install gcc
	brew install bat
	brew install git-delta
	brew install node
	brew install corepack
	brew install zoxide

zoxide_for_fish:
	echo "Run:"
	echo "zoxide init fish | source"

.PHONY help:
help:
	@echo "make brew_packages"
	@echo "make help"