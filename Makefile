.PHONY: help
help: ## Show this help message
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-35s\033[0m %s\n", $$1, $$2}'


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


# https://askubuntu.com/questions/278693/how-do-i-stop-orca-screen-reader
# To allow removal if packages not there, example KDE:
# https://superuser.com/questions/518859/ignore-packages-that-are-not-currently-installed-when-using-apt-get-remove
.PHONY remove_screen_reader:
remove_screen_reader: ## Remove Orca screen reader
	sudo dpkg --purge orca gnome-orca


.PHONY link_starship_configuration:
link_starship_configuration: ## Link Starship configuration file
	rm -f ~/.config/starship.toml
	ln -s $(CURDIR)/config_files/starship.toml ~/.config/starship.toml


.PHONY link_ghostty_configuration:
link_ghostty_configuration: ## Link Ghostty terminal configuration file
	mkdir -p ~/.config/ghostty
	rm -f ~/.config/ghostty/config
	ln -s $(CURDIR)/dot_config/ghostty/config ~/.config/ghostty/config


.PHONY link_fish_configuration:
link_fish_configuration: ## Link Fish shell configuration file
	mkdir -p ~/.config/fish/functions
	rm ~/.config/fish/config.fish
	ln -s $(CURDIR)/fish/config.fish ~/.config/fish/config.fish
	ln -s $(CURDIR)/fish/functions/* ~/.config/fish/functions/

.PHONY link_tmux_configuration:
link_tmux_configuration: ## Link tmux configuration file
	rm -f ~/.tmux.conf
	ln -s $(CURDIR)/config_files/.tmux.conf ~/.tmux.conf


.PHONY link_code_configuration:
link_code_configuration: ## Link VSCode configuration file
	ln -s $(CURDIR)/code/settings.json ~/.config/Code/User


.PHONY git_config:
git_config: ## Configure git settings (GPG signing, merge options)
	# Sign by dedault:
	git config --global commit.gpgsign true
	# https://stackoverflow.com/questions/5519007/how-do-i-make-git-merges-default-be-no-ff-no-commit
	git config --global merge.commit no
	git config --global merge.ff no


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


.PHONY configure_fastfetch:
configure_fastfetch: ## Configure Fastfetch system information tool
	@echo "Configure Fastfetch"
	mkdir -p ~/.config/fastfetch/assets
	rm -rf ~/.config/fastfetch/config.jsonc
	ln -s $(CURDIR)/config_files/fastfetch/config.jsonc ~/.config/fastfetch/config.jsonc
	rm -rf ~/.config/fastfetch/assets/greek_fire_no_background.png
	ln -s $(CURDIR)/images/greek_fire_no_background.png ~/.config/fastfetch/assets/greek_fire_no_background.png


.PHONY ulauncher_additions:
ulauncher_additions: ## Setup Ulauncher additions
	$(CURDIR)/setup_ulauncher_additions


#                    ▄
#                   ▟█▙
#                  ▟███▙
#                 ▟█████▙
#                ▟███████▙
#               ▂▔▀▜██████▙
#              ▟██▅▂▝▜█████▙
#             ▟█████████████▙
#            ▟███████████████▙
#           ▟█████████████████▙
#          ▟███████████████████▙
#         ▟█████████▛▀▀▜████████▙
#        ▟████████▛      ▜███████▙
#       ▟█████████        ████████▙
#      ▟██████████        █████▆▅▄▃▂
#     ▟██████████▛        ▜█████████▙
#    ▟██████▀▀▀              ▀▀██████▙
#   ▟███▀▘                       ▝▀███▙
#  ▟▛▀                               ▀▜▙
#
# Arch Specific
# Logo: https://gist.github.com/LnLcFlx/18eb10bc74ed9e497d0fedc69468f933
# and https://www.reddit.com/r/archlinux/comments/g8iygf/arch_linux_logo_using_unicode_block_characters/

.PHONY link_umsm_default:
link_umsm_default: ## Link UWSM default configuration
	rm ~/.config/uwsm/default
	ln -s $(CURDIR)/dot_config/uwsm/default ~/.config/uwsm/default
	ls -lah ~/.config/uwsm/default


.PHONY arch_additional:
arch_additional: ## Install additional packages for Arch Linux
	@echo "Additional for Arch Installation"
	sudo pacman -Syy  # Update Packages
	sudo pacman -S micro # Micro editor
	sudo pacman -S git-delta

	# Was instructed to use yay:

	yay -S ttf-nerd-fonts-symbols-mono --noconfirm	# Nerd Font Symbols Mono
	yay -S code-nerd-fonts --noconfirm	# Nerd fonts
	yay -S vscodium-bin --noconfirm	# VSCodium
	yay -S enpass-bin --noconfirm	# Enpass
	yay -S fish --noconfirm	# Fish shell
	yay -S claude-code --noconfirm	# Claude Code; using it a lot lately
	yay -S telegram-desktop --noconfirm	# Telegram Desktop
	yay -S discord --noconfirm	# Discord
	yay -S uv --noconfirm	# Astral's uv for Python
	yay -Sy brave-bin --noconfirm	# Brave Browser
	yay -Sy lollypop --noconfirm	# Lollypop Player
	yay -S figlet --noconfirm	# Using it for ASCII banners
	yay -S tmux --noconfirm	# Our beloved multiplexer

	# Development
	yay -S pycharm --noconfirm	# Pycharm IDE



.PHONY omarchy_extra_themes:
omarchy_extra_themes: ## Install extra themes for Omarchy
	@echo "Omarchy Extra Themes"
	omarchy-theme-install https://github.com/dotsilva/omarchy-purplewave-theme
	omarchy-theme-install https://github.com/Hydradevx/omarchy-azure-glow-theme


.PHONY omarchy_personal_preferences:
omarchy_personal_preferences: ## Configure Omarchy personal preferences
	@echo "Omarchy Personal Preferences"
	@echo "Set Terminal to Ghostty"
	omarchy-install-terminal ghostty
