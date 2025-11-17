.PHONY: help
help: ## Show this help message
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-35s\033[0m %s\n", $$1, $$2}'


.PHONY additional_packages:
additional_packages: ## Install additional packages (Chromium, wl-clipboard, Enpass)
	@echo "Install Additional Packages"
	@echo "Cromium"
	sudo apt install -y chromium
	sudo apt-get install -y wl-clipboard
	@echo "Enpass"
	echo "deb https://apt.enpass.io/  stable main" | sudo tee /etc/apt/sources.list.d/enpass.list
	wget -O - https://apt.enpass.io/keys/enpass-linux.key | sudo tee /etc/apt/trusted.gpg.d/enpass.asc
	sudo apt-get update
	sudo apt-get install -y enpass


.PHONY install_brew:
install_brew: ## Run Homebrew installation script
	./install_homebrew


.PHONY install_fish_shell:
install_fish_shell: ## Install Fish shell
	sudo apt get install fish


.PHONY snap_packages:
snap_packages: ## Install snap packages (Gradia)
	#
	# Gradia from "It's FOSS - Linux Portal":
	#
	# https://www.youtube.com/watch?v=OQqv1UeURqA
	sudo snap install gradia


.PHONY brew_packages:
brew_packages: ## Install Homebrew packages with utilities and frameworks
	brew update
	brew upgrade
	brew install gcc
	brew install fd
	brew install fzf
	brew install python@3.13
	brew install bat
	brew install git-delta
	brew install corepack
	brew install gping
	brew install figlet
	brew install httpie
	brew install starship
	brew install micro  # The text editor
	brew install tmux
	brew install tpm  # Tmux Package Manager
	brew install ripgrep
	brew install xh
	brew install git-trim
	brew install dust	# https://github.com/bootandy/dust du + rust = dust. Like du but more intuitive.

	@echo "Instructions for Git-Delta"
	bat git_delta.md

	#
	# These are currently installed from Omakumb
	# here for reference:
	#
	# brew install node
	# brew install zoxide
	# brew install lsd


.PHONY brew_development:
brew_development: ## Install development environments via Homebrew (Bun)
	brew install oven-sh/bun/bun


.PHONY zoxide_for_bash_and_fish:
zoxide_for_bash_and_fish: ## Display setup instructions for zoxide (smarter cd command)
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


# https://askubuntu.com/questions/278693/how-do-i-stop-orca-screen-reader
# To allow removal if packages not there, example KDE:
# https://superuser.com/questions/518859/ignore-packages-that-are-not-currently-installed-when-using-apt-get-remove
.PHONY remove_screen_reader:
remove_screen_reader: ## Remove Orca screen reader
	sudo dpkg --purge orca gnome-orca


.PHONY post_omakumb_gnome_tweaking:
post_omakumb_gnome_tweaking: ## Post-Omakumb GNOME tweaking (Burn My Windows setup)
	@echo "Post Omakumb Gnome Tweaking - Burn My Windows Setup"
	$(CURDIR)/gnome/setup_burn_my_windows


.PHONY: install_additional_packages
install_additional_packages: ## Install additional packages (exfat-fuse)
	@echo "Install Additional Packages"

	# Maintenance
	#
	sudo apt autoremove

	# Exfat support for USB drives: allows to copy files larger than 4.3Gb
	# https://askubuntu.com/questions/999580/why-is-exfat-greyed-out-in-gparted
	#
	sudo apt install -y exfat-fuse


.PHONY ulauncher_additions:
ulauncher_additions: ## Setup Ulauncher additions
	$(CURDIR)/setup_ulauncher_additions
