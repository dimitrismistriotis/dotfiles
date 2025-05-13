#
# Small Aliases
#
alias pbcopy='wl-copy'
alias pbpaste='wl-paste'
#
# After version 4.0.1: https://fishshell.com/docs/current/cmds/fish_add_path.html
# fish_add_path ~/bin
#
set PATH ~/bin $PATH

#
# Zoxide
# https://github.com/ajeetdsouza/zoxide
#
zoxide init fish | source
#
# Homebrew:
# https://docs.brew.sh/Homebrew-on-Linux
#
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

#
# Micro Editor
#
if type -q 'micro'
     # echo "micro exists"
     #
     # Expors for any editor:
     #
     export EDITOR='micro'
     export VISUAL='micro'
     # Specific to micro:
     export MICRO_TRUECOLOR=1
end

#
# Startfish
#
source (/home/linuxbrew/.linuxbrew/bin/starship init fish --print-full-init | psub)

#
# Run on new terminal; nothing amazing just geeokness
#
fastfetch
