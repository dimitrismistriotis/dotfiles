#
# As I use ytt | pbcopy a lot to ask different LLMS to summarise
#
function ytt_pbcopy
    echo $argv[1]
    ytt $argv[1] | pbcopy
end
