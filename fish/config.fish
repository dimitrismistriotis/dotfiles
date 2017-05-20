# Path to Oh My Fish install.
set -gx OMF_PATH "/home/dimitry/.local/share/omf"

# Customize Oh My Fish configuration path.
#set -gx OMF_CONFIG "/home/dimitry/.config/omf"

# Load oh-my-fish configuration.
source $OMF_PATH/init.fish

# Chruby
# https://github.com/postmodern/chruby
# and
# https://github.com/JeanMertz/chruby-fish
#
# Source:
source /usr/local/share/chruby/chruby.fish
# Fish integration
source /usr/local/share/chruby/auto.fish
# Default ruby:
if test (which chruby)
  chruby ruby-2.3.1
end

set PATH /home/dimitry/google-cloud-sdk/bin $PATH
set PATH ~/bin/ $PATH

eval (python -m virtualfish)

