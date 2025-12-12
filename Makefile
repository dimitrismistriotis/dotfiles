.PHONY: help
help: ## Show this help message
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-35s\033[0m %s\n", $$1, $$2}'


#     .--.
#    |o_o |
#    |:_/ |
#   //   \ \
#  (|     | )
# /'\_   _/`\
# \___)=(___/    Przemek Borys
#
# General Linux Dotfiles

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


.PHONY link_micro_configuration:
link_micro_configuration: ## Link Micro editor configuration files
	rm -rf ~/.config/micro
	mkdir -p ~/.config/micro
	ln -s $(CURDIR)/micro/* ~/.config/micro


.PHONY git_config:
git_config: ## Configure git settings (all settings except user info)
	# Setup from following article:
	# https://blog.gitbutler.com/how-git-core-devs-configure-git/

	@echo "Configuring git global settings..."

	# Push settings
	git config --global push.default simple
	git config --global push.autoSetupRemote true

	# Aliases
	git config --global alias.plr "pull --rebase"
	git config --global alias.commitlog "log --pretty=format:'%ad - %an: %s' --date=iso"

	# Color
	git config --global color.ui true

	# Merge settings
	git config --global merge.ff no
	git config --global merge.commit no
	git config --global merge.conflictstyle diff3

	# Init
	git config --global init.defaultBranch master

	# Pull
	git config --global pull.rebase true

	# Column
	git config --global column.ui auto

	# Branch & Tag sorting
	git config --global branch.sort -committerdate
	git config --global tag.sort version:refname

	# Fetch settings
	git config --global fetch.prune true
	git config --global fetch.pruneTags true
	git config --global fetch.all true

	# Commit settings
	git config --global commit.gpgsign true
	git config --global commit.verbose true

	# Delta pager settings: https://github.com/dandavison/delta 
	git config --global core.pager delta
	git config --global interactive.diffFilter "delta --color-only"
	git config --global delta.navigate true
	git config --global delta.light false

	# Diff settings
	git config --global diff.colorMoved default


.PHONY configure_fastfetch:
configure_fastfetch: ## Configure Fastfetch system information tool
	@echo "Configure Fastfetch"
	mkdir -p ~/.config/fastfetch/assets
	rm -rf ~/.config/fastfetch/config.jsonc
	ln -s $(CURDIR)/config_files/fastfetch/config.jsonc ~/.config/fastfetch/config.jsonc
	rm -rf ~/.config/fastfetch/assets/greek_fire_no_background.png
	ln -s $(CURDIR)/images/greek_fire_no_background.png ~/.config/fastfetch/assets/greek_fire_no_background.png


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

	yay -S ttf-nerd-fonts-symbols-mono --noconfirm # Nerd Font Symbols Mono
	yay -S code-nerd-fonts --noconfirm # Nerd fonts
	yay -S vscodium-bin --noconfirm # VSCodium is a community-driven, freely-licensed binary distribution of Microsoft’s editor VS Code.
	yay -S enpass-bin --noconfirm # Enpass
	yay -S fish --noconfirm # Fish shell
	yay -S claude-code --noconfirm # Claude Code; using it a lot lately
	yay -S telegram-desktop --noconfirm # Telegram Desktop
	yay -S discord --noconfirm # Discord
	yay -S uv --noconfirm # Astral's uv for Python
	yay -Sy brave-bin --noconfirm # Brave Browser
	yay -Sy lollypop --noconfirm # Lollypop Player
	yay -S figlet --noconfirm # Using it for ASCII banners
	yay -S tmux --noconfirm # Our beloved multiplexer
	yay -S lvsk-calendar --noconfirm # Nice Calendar

	# Development
	yay -S pycharm --noconfirm # Pycharm IDE
	yay -S render-cli-bin # Shop uses Render
	yay -S pre-commit --noconfirm # Pre Commit hools for Git
	yay -S bun --noconfirm # Bun JS Package Manager


.PHONY arch_additional_browsers:
arch_additional_browsers: ## Install additional Other Browsers for Arch Linux
	yay -S librewolf-bin --noconfirm # librewolf Browser, Firefox fork
	yay -S zen-browser-bin --noconfirm # Zen privacy oriented browser


.PHONY arch_additional_utilities:
arch_additional_utilities: ## Install additional utility packages for Arch Linux
	yay -S extra/wget --noconfirm # wget - Network utility to retrieve files from the web


.PHONY omarchy_removals:
omarchy_removals: ## Remove packages installed from Omarchy where I use alternatives
	yay -R 1password-cli 1password-beta


.PHONY omarchy_extra_themes:
omarchy_extra_themes: ## Install extra themes for Omarchy
	@echo "Omarchy Extra Themes"
	omarchy-theme-install https://github.com/dotsilva/omarchy-purplewave-theme
	omarchy-theme-install https://github.com/jjdizz1l/aetheria
	omarchy-theme-install https://github.com/Hydradevx/omarchy-azure-glow-theme


.PHONY omarchy_personal_preferences:
omarchy_personal_preferences: ## Configure Omarchy personal preferences
	@echo "Omarchy Personal Preferences, Placeholder"


.PHONY omarchy_personal_bindings:
omarchy_personal_bindings: ## Configure Omarchy Personal Key Bindings
	@echo "Omarchy Personal Key Bindings"
	rm ~/.config/hypr/bindings.conf
	ln -s $(CURDIR)/dot_config/hypr/bindings.conf ~/.config/hypr/bindings.conf

.PHONY omarchy_all:
omarchy_all: arch_additional arch_additional_utilities arch_additional_browsers omarchy_removals link_umsm_default omarchy_extra_themes omarchy_personal_bindings	## All Omarchy entries

#     _    _ _
#    / \  | | |
#   / _ \ | | |
#  / ___ \| | |
# /_/   \_\_|_|
# 
# All

.PHONY all:
all: omarchy_all link_starship_configuration link_ghostty_configuration link_fish_configuration link_tmux_configuration link_code_configuration link_micro_configuration git_config configure_fastfetch	## Make "all" Makefile entries
	@echo 'End of make all Makefile entries'

