.PHONY help:
help:
	@echo "make help"
	@echo "make additional_packages"
	@echo "make arch_additional"
	@echo "make omarchy_extra_themes"
	@echo "make brew_packages"
	@echo "make zoxide_for_bash_and_fish"
	@echo "make link_starship_configuration"
	@echo "make link_ghostty_configuration"
	@echo "make link_tmux_configuration"
	@echo "make link_code_configuration"
	@echo "make link_umsm_default"
	@echo "make git_config"
	@echo "make post_omakumb_gnome_tweaking"
	@echo "make install_additional_packages"
	@echo "make configure_fastfetch"


.PHONY additional_packages:
additional_packages:
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
install_brew:  # Run Homebrew Installation Script
	./install_homebrew


.PHONY install_fish_shell:
install_fish_shell:
	sudo apt get install fish


.PHONY snap_packages:
snap_packages:  # Brew packages with utilities and frameworks
	#
	# Gradia from "It's FOSS - Linux Portal":
	#
	# https://www.youtube.com/watch?v=OQqv1UeURqA
	sudo snap install gradia


.PHONY brew_packages:
brew_packages:  # Brew packages with utilities and frameworks
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
brew_development:  # Development environments, can be installed from elsewhere
	brew install oven-sh/bun/bun


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


# https://askubuntu.com/questions/278693/how-do-i-stop-orca-screen-reader
# To allow removal if packages not there, example KDE:
# https://superuser.com/questions/518859/ignore-packages-that-are-not-currently-installed-when-using-apt-get-remove
.PHONY remove_screen_reader:
remove_screen_reader:
	sudo dpkg --purge orca gnome-orca


.PHONY link_starship_configuration:
link_starship_configuration:
	rm -f ~/.config/starship.toml
	ln -s $(CURDIR)/config_files/starship.toml ~/.config/starship.toml


.PHONY link_ghostty_configuration:
link_ghostty_configuration:
	mkdir -p ~/.config/ghostty
	rm -f ~/.config/ghostty/config
	ln -s $(CURDIR)/dot_config/ghostty/config ~/.config/ghostty/config


.PHONY link_fish_configuration:
link_fish_configuration:
	mkdir -p ~/.config/fish/functions
	rm ~/.config/fish/config.fish
	ln -s $(CURDIR)/fish/config.fish ~/.config/fish/config.fish
	ln -s $(CURDIR)/fish/functions/* ~/.config/fish/functions/

.PHONY link_tmux_configuration:
link_tmux_configuration:
	rm -f ~/.tmux.conf
	ln -s $(CURDIR)/config_files/.tmux.conf ~/.tmux.conf


.PHONY link_code_configuration:
link_code_configuration:
	ln -s $(CURDIR)/code/settings.json ~/.config/Code/User


.PHONY git_config:
git_config:
	# Sign by dedault:
	git config --global commit.gpgsign true
	# https://stackoverflow.com/questions/5519007/how-do-i-make-git-merges-default-be-no-ff-no-commit
	git config --global merge.commit no
	git config --global merge.ff no


.PHONY post_omakumb_gnome_tweaking:
post_omakumb_gnome_tweaking:
	@echo "Post Omakumb Gnome Tweaking - Burn My Windows Setup"
	$(CURDIR)/gnome/setup_burn_my_windows


,PHONY: install_additional_packages
install_additional_packages:
	@echo "Install Additional Packages"

	# Maintenance
	#
	sudo apt autoremove

	# Exfat support for USB drives: allows to copy files larger than 4.3Gb
	# https://askubuntu.com/questions/999580/why-is-exfat-greyed-out-in-gparted
	#
	sudo apt install -y exfat-fuse


.PHONY configure_fastfetch:
configure_fastfetch:
	@echo "Configure Fastfetch"
	mkdir -p ~/.config/fastfetch/assets
	rm -rf ~/.config/fastfetch/config.jsonc
	ln -s $(CURDIR)/config_files/fastfetch/config.jsonc ~/.config/fastfetch/config.jsonc
	rm -rf ~/.config/fastfetch/assets/greek_fire_no_background.png
	ln -s $(CURDIR)/images/greek_fire_no_background.png ~/.config/fastfetch/assets/greek_fire_no_background.png


.PHONY ulauncher_additions:
ulauncher_additions:
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
link_umsm_default:
	rm ~/.config/uwsm/default
	ln -s $(CURDIR)/dot_config/uwsm/default ~/.config/uwsm/default
	ls -lah ~/.config/uwsm/default


.PHONY arch_additional:
arch_additional:
	@echo "Additional for Arch Installation"
	sudo pacman -Syy  # Update Packages
	sudo pacman -S micro # Micro editor
	sudo pacman -S git-delta

	# Was instructed to use yay:

	yay -S ttf-nerd-fonts-symbols-mono 	# Nerd Font Symbols Mono
	yay -S code-nerd-fonts							# Nerd fonts
	yay -S vscodium-bin									# VSCodium
	yay -S enpass-bin										# Enpass
	yay -S fish													# Fish shell
	yay -S claude-code									# Claude Code; using it a lot lately
	yay -S telegram-desktop							# Telegram Desktop
	yay -S uv														# Astral's uv for Python
	yay -Sy brave-bin										# Brave Browser
	yay -Sy lollypop										# Lollypop Player
	yay -Sy git-trim										# To remove merged branches
	yay -Sy figlet											# Using it for ASCII banners
	yay -Sy tmux												# Our beloved multiplexer


.PHONY omarchy_extra_themes:
omarchy_extra_themes:
	@echo "Omarchy Extra Themes"
	omarchy-theme-install https://github.com/dotsilva/omarchy-purplewave-theme
	omarchy-theme-install https://github.com/Hydradevx/omarchy-azure-glow-theme

.PHONY yomarchy_personal_preferences:
yomarchy_personal_preferences:
	@echo "Omarchy Personal Preferences"
	@echo "Set Terminal to Ghostty"
	omarchy-install-terminal ghostty

