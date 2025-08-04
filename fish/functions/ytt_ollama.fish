#
# ⏯️ As I use ytt | ollama to ask it to sumarise a YT Video
#
function ytt_ollama
    echo $argv[1]
    set transcript (ytt $argv[1])
    set llm_prompt "Please summarise the following text: <text> $transcript </text>"
    # echo $llm_prompt
    echo $llm_prompt | ollama run gemma3
end
