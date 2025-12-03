function try
    set script_path '/usr/bin/try'
    set cmd

    # Check if first argument is a known command
    switch $argv[1]
        case clone worktree init
            set cmd (/usr/bin/env ruby $script_path --path "/home/dimitri0s/src/tries" $argv 2>/dev/tty)
        case '*'
            set cmd (/usr/bin/env ruby $script_path cd --path "/home/dimitri0s/src/tries" $argv 2>/dev/tty)
    end

    set rc $status
    if test $rc -eq 0
        switch "$cmd"
            case '* && *'
                eval $cmd
            case '*'
                printf %s "$cmd"
        end
    else
        printf %s "$cmd"
    end
end
