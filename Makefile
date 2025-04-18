.PHONY help:
help:
	@echo "make brew_packages"
	@echo "make zoxide_for_bash_and_fish"
	@echo "make help"
	@echo "make link_starship_configuration"
	@echo "make link_tmux_configuration"
	@echo "make link_wezterm_config"
	@echo "make oh_my_fish"
	@echo "make git_config"
	@echo "make post_omakumb_gnome_tweaking"
	@echo "make download_nerdfonts"

.PHONY install_brew:
install_brew:  # Run Homebrew Installation Script
	./install_homebrew


.PHONY brew_packages:
brew_packages:  # Brew packages with utilities and frameworks
	brew update
	brew upgrade
	brew install gcc
	brew install python@3.12
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

	@echo "Instructions for Git-Delta"
	bat git_delta.md

	#
	# These are currently installed from Omakumb
	# here for reference:
	#
  # brew install node
  # brew install zoxide
  # brew install lsd


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


#
# https://askubuntu.com/questions/278693/how-do-i-stop-orca-screen-reader
# To allow removal if packages not there, example KDE:
# https://superuser.com/questions/518859/ignore-packages-that-are-not-currently-installed-when-using-apt-get-remove
#
.PHONY remove_screen_reader:
remove_screen_reader:
	sudo dpkg --purge orca gnome-orca

.PHONY link_starship_configuration:
link_starship_configuration:
	ln -s $(CURDIR)/config_files/starship.toml ~/.config/starship.toml 

.PHONY link_tmux_configuration:
link_tmux_configuration:
	ln -s $(CURDIR)/config_files/.tmux.conf ~/.tmux.conf 

.PHONY git_config:
git_config:
	# Sign by dedault:
	git config --global commit.gpgsign true
	# https://stackoverflow.com/questions/5519007/how-do-i-make-git-merges-default-be-no-ff-no-commit
	git config --global merge.commit no
	git config --global merge.ff no

.PHONY oh_my_fish:
oh_my_fish:
	# From Website:
	curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish

.PHONY link_wezterm_config:
link_wezterm_config:
	ln -s $(CURDIR)/dot_wezterm.lua  ~/.wezterm.lua

.PHONY post_omakumb_gnome_tweaking:
post_omakumb_gnome_tweaking:
	@echo "Post Omakumb Gnome Tweaking"
	#
	# Install Burn My Windows
	#
	gnome-extensions enable burn-my-windows@schneegans.github.com
	#
	# Copy gsettings schemas so that they can be set from command line:
	#
	sudo cp ~/.local/share/gnome-shell/extensions/burn-my-windows@schneegans.github.com/schemas/org.gnome.shell.extensions.burn-my-windows.gschema.xml /usr/share/glib-2.0/schemas/
	sudo cp ~/.local/share/gnome-shell/extensions/burn-my-windows@schneegans.github.com/schemas/org.gnome.shell.extensions.burn-my-windows-profile.gschema.xml /usr/share/glib-2.0/schemas/
	#
	# Recompile
	#
	sudo glib-compile-schemas /usr/share/glib-2.0/schemas/
	#
	# Set values, my preferences - smiley
	#
	gsettings set org.gnome.shell.extensions.burn-my-windows-profile apparition-enable-effect false
	gsettings set org.gnome.shell.extensions.burn-my-windows-profile aura-glow-enable-effect false
	gsettings set org.gnome.shell.extensions.burn-my-windows-profile broken-glass-enable-effect true
	gsettings set org.gnome.shell.extensions.burn-my-windows-profile doom-enable-effect false
	gsettings set org.gnome.shell.extensions.burn-my-windows-profile energize-a-enable-effect false
	gsettings set org.gnome.shell.extensions.burn-my-windows-profile energize-b-enable-effect true
	gsettings set org.gnome.shell.extensions.burn-my-windows-profile fire-enable-effect true
	gsettings set org.gnome.shell.extensions.burn-my-windows-profile focus-enable-effect false
	gsettings set org.gnome.shell.extensions.burn-my-windows-profile glide-enable-effect false
	gsettings set org.gnome.shell.extensions.burn-my-windows-profile glitch-enable-effect true
	gsettings set org.gnome.shell.extensions.burn-my-windows-profile hexagon-enable-effect false
	gsettings set org.gnome.shell.extensions.burn-my-windows-profile incinerate-enable-effect false
	gsettings set org.gnome.shell.extensions.burn-my-windows-profile matrix-enable-effect true
	gsettings set org.gnome.shell.extensions.burn-my-windows-profile mushroom-enable-effect false
	gsettings set org.gnome.shell.extensions.burn-my-windows-profile paint-brush-enable-effect false
	gsettings set org.gnome.shell.extensions.burn-my-windows-profile pixelate-enable-effect false
	gsettings set org.gnome.shell.extensions.burn-my-windows-profile pixel-wheel-enable-effect false
	gsettings set org.gnome.shell.extensions.burn-my-windows-profile pixel-wipe-enable-effect true
	gsettings set org.gnome.shell.extensions.burn-my-windows-profile portal-enable-effect false
	gsettings set org.gnome.shell.extensions.burn-my-windows-profile rgbwarp-enable-effect false
	gsettings set org.gnome.shell.extensions.burn-my-windows-profile snap-enable-effect true
	gsettings set org.gnome.shell.extensions.burn-my-windows-profile team-rocket-enable-effect false
	gsettings set org.gnome.shell.extensions.burn-my-windows-profile trex-enable-effect false
	gsettings set org.gnome.shell.extensions.burn-my-windows-profile tv-enable-effect false
	gsettings set org.gnome.shell.extensions.burn-my-windows-profile tv-glitch-enable-effect true
	gsettings set org.gnome.shell.extensions.burn-my-windows-profile wisps-enable-effect false

.PHONY download_nerdfonts:
download_nerdfonts:
	@echo "Download NerdFonts"
	# 
	# References:
	# 
	# https://www.nerdfonts.com/font-downloads
	# https://medium.com/@almatins/install-nerdfont-or-any-fonts-using-the-command-line-in-debian-or-other-linux-f3067918a88c
	# 
	# Follow Ups:
	# 
	# Do not Download if already there
	# Add more fonts, perhaps all?
	# 
	wget -P ~/.local/share/fonts https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/FiraCode.zip
	cd ~/.local/share/fonts \
	unzip FiraCode.zip
	rm ~/.local/share/fonts/FiraCode.zip*
	fc-cache -fv
