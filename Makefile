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
	brew install gping
	brew install python@3.12
	brew install figlet
	brew install lsd
	brew install httpie

.PHONY zoxide_for_bash_and_fish:
zoxide_for_bash_and_fish:
	#
	# A smarter cd command. Supports all major shells.
	# https://github.com/ajeetdsouza/zoxide
	#
	@echo ""
	@echo "Zoxide or bash:"
	@echo ""
	@echo 'eval "$(zoxide init bash)"'

	@echo ""
	@echo "Zoxide or fish:"
	@echo ""
	@echo "Add this to your configuration (usually ~/.config/fish/config.fish)"
	@echo "zoxide init fish | source"


.PHONY help:
help:
	@echo "make brew_packages"
	@echo "make zoxide_for_bash_and_fish"
	@echo "make help"
