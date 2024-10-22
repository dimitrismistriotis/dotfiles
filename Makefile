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
	
.PHONY help:
help:
	@echo "make brew_packages"
	@echo "make zoxide_for_bash_and_fish"
	@echo "make help"
	@echo "make link_starship_configuration"
	@echo "make link_tmux_configuration"
	@echo "make git_config"
	@echo "make oh_my_fish"
