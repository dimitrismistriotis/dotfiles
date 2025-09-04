#
# ⏯️ As I use ytt | ollama to ask it to sumarise a YT Video
#
function ytt_ollama
    if test -z "$argv[1]"
        read -P "Enter YouTube URL: " yt_url
    else
        set yt_url $argv[1]
    end

    echo $yt_url

    set transcript (ytt $yt_url)
    set llm_prompt "Please summarise the following text: <text> $transcript </text>. Do not prompt for any further actions."
    # echo $llm_prompt
    echo $llm_prompt | ollama run gemma3
end
