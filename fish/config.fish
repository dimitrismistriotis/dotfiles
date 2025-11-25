if status is-interactive
     # Commands to run in interactive sessions can go here
     #
     # After version 4.0.1: https://fishshell.com/docs/current/cmds/fish_add_path.html
     # fish_add_path ~/bin
     # set PATH ~/.local/bin ~/bin  $PATH
     set PATH ~/bin  $PATH

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

