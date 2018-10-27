# Path to Oh My Fish install.
# set -gx OMF_PATH "/home/dimitry/.local/share/omf"

# Customize Oh My Fish configuration path.
#set -gx OMF_CONFIG "/home/dimitry/.config/omf"

# Load oh-my-fish configuration.
# source $OMF_PATH/init.fish

#
# Chruby
#
#set CHRUBY_ROOT '/usr/share/chruby/chruby.sh'
set CHRUBY_ROOT '/usr/'
source ~/chruby-fish/share/chruby/chruby.fish
source ~/chruby-fish/share/chruby/auto.fish

# Default ruby:
# chruby ruby-2.5.0
chruby ruby-2.5.3



# set PATH /home/dimitry/google-cloud-sdk/bin $PATH
set PATH ~/bin/ $PATH

#eval (python -m virtualfish)

