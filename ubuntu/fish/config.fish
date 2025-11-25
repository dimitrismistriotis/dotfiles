
if status is-interactive
    # ...

    # Homebrew:
    # https://docs.brew.sh/Homebrew-on-Linux

    if test -f /home/linuxbrew/.linuxbrew/bin/brew
        eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    end

    # ...
end
