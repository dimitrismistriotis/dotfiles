# Path to Oh My Fish install.
# set -gx OMF_PATH "/home/dimitry/.local/share/omf"

# Customize Oh My Fish configuration path.
#set -gx OMF_CONFIG "/home/dimitry/.config/omf"

# Load oh-my-fish configuration.
# source $OMF_PATH/init.fish

# Chruby
# https://github.com/postmodern/chruby
# and
# https://github.com/JeanMertz/chruby-fish
#
# Source:
source /usr/local/share/chruby/chruby.fish
# Default ruby:
chruby ruby-2.6.5

#
# GO-lang
#
set -gx GOPATH $HOME/Go
set -gx GOROOT (go env GOROOT)
set PATH $GOROOT/bin $PATH

# set PATH /home/dimitry/google-cloud-sdk/bin $PATH
set PATH ~/bin/ $PATH
set PATH ~/.local/bin $PATH

#eval (python -m virtualfish)

