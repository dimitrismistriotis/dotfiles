# Port of the 'n' function to open files or directories in Neovim from Omarchy
# n() { if [ "$#" -eq 0 ]; then nvim .; else nvim "$@"; fi; }
function n
    if test (count $argv) -eq 0
        nvim .
    else
        nvim $argv
    end
end
