if status is-interactive
    # Commands to run in interactive sessions

    # Path Additions
    # https://fishshell.com/docs/current/cmds/fish_add_path.html
    fish_add_path ~/bin
    if test -d ~/.local/bin
        fish_add_path ~/.local/bin
    end
    if test -d ~/.cargo/bin # For rust compiled commands
        fish_add_path ~/.cargo/bin
    end
    # Added by LM Studio CLI (lms)
    if test -d ~/.lmstudio/bin
        # set -gx PATH $PATH /home/dimitri0s/.lmstudio/bin
        fish_add_path -a ~/.lmstudio/bin
    end
    # End of LM Studio CLI section
    if test -d ~/development/flutter/bin # For Flutter and suggested location
        set -Ux CHROME_EXECUTABLE /usr/bin/chromium
        fish_add_path ~/development/flutter/bin
        fish_add_path ~/.pub-cache/bin
    end
    if test -d /opt/android-sdk # Android SDK
        set -gx ANDROID_HOME /opt/android-sdk
        set -gx ANDROID_SDK_ROOT /opt/android-sdk
        fish_add_path -a $ANDROID_HOME/cmdline-tools/latest/bin
        fish_add_path -a $ANDROID_HOME/platform-tools
    end

    # Micro Editor
    if type -q micro
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
    alias tmkill="tmux kill-server" # kill tmux server for end of day cleanup

    # Run on new terminal; nothing amazing just geekness

    fastfetch
end
