if status is-interactive
    # Commands to run in interactive sessions

    # Path Additions
    # https://fishshell.com/docs/current/cmds/fish_add_path.html
    fish_add_path ~/bin
    # fish_add_path ~/.local/bin
    # Added by LM Studio CLI (lms)
    if test -d ~/.lmstudio/bin
        # set -gx PATH $PATH /home/dimitri0s/.lmstudio/bin
        fish_add_path -a ~/.lmstudio/bin
    end
    # End of LM Studio CLI section

    # Micro Editor
    if type -q 'micro'
        # echo "micro exists"
        #
        # Exports for any editor:
        #
        export EDITOR='micro'
        export VISUAL='micro'
        # Specific to micro:
        export MICRO_TRUECOLOR=1
    end

    # Zoxide
    # https://github.com/ajeetdsouza/zoxide
 
    zoxide init fish | source

    # Starship:
    # https://starship.rs/

    starship init fish | source

    # Set up fzf key bindings

    fzf --fish | source

    # Aliases

    alias lg="lazygit"
    alias pbcopy='wl-copy'
    alias pbpaste='wl-paste'
    alias tmkill="tmux kill-server"  # kill tmux server for end of day cleanup

    # Run on new terminal; nothing amazing just geeokness

    fastfetch
end




