# Pycharm with Wayland option
function wayland_pycharm
    pycharm -Dawt.toolkit.name=WLToolkit $argv >/dev/null 2>&1 &
    disown
end
