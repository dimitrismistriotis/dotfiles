.PHONY brew_packages:
brew_packages:  # Brew packages with utilities and frameworks
	brew update
	brew install gcc
	brew install bat
	brew install git-delta
	brew install node
	brew install corepack

.PHONY help:
help:
	@echo "make brew_packages"
	@echo "make help"