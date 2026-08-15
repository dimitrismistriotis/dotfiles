-- Personal keybinding overrides for Omarchy 4 ("Quarto").
-- Loaded by ~/.config/hypr/hyprland.lua via require("hypr.bindings"), after
-- Omarchy's defaults.
--
-- Ported from the old dot_config/hypr/bindings.conf, which Quarto no longer
-- reads (nothing sources .conf any more; only the .lua files are required).
--
-- Anything that merely restated an Omarchy default was dropped in the port --
-- Super+Return, Super+Shift+B/F/N/A/E/Y/X, Super+Shift+D (lazydocker) and the
-- HEY/WhatsApp/Google Messages web apps all still work without being repeated
-- here. Only genuine divergences from the defaults live below.
--
-- To change a key Omarchy already binds, hl.unbind() it first, then rebind.
-- See the current set with: omarchy menu keybindings --print

-- Activity monitor. No Omarchy default on this key, so no unbind needed.
o.bind("SUPER + SHIFT + T", "Activity", { tui = "btop" })

-- Obsidian, with software rendering and Wayland IME.
hl.unbind("SUPER + SHIFT + O")
o.bind("SUPER + SHIFT + O", "Obsidian", {
  launch = "obsidian -disable-gpu --enable-wayland-ime",
  focus = "^obsidian$",
})

-- Typora in place of Omawrite.
hl.unbind("SUPER + SHIFT + W")
o.bind("SUPER + SHIFT + W", "Typora", { launch = "typora --enable-wayland-ime" })

-- Telegram in place of Signal.
hl.unbind("SUPER + SHIFT + G")
o.bind("SUPER + SHIFT + G", "Telegram", { launch = "Telegram" })

-- Chromium in place of the HEY calendar web app.
hl.unbind("SUPER + SHIFT + C")
o.bind("SUPER + SHIFT + C", "Chromium", { launch = "chromium" })

-- PyCharm in place of Google Photos.
hl.unbind("SUPER + SHIFT + P")
o.bind("SUPER + SHIFT + P", "PyCharm", { launch = "pycharm", focus = "pycharm" })

-- Lollypop in place of Spotify.
hl.unbind("SUPER + SHIFT + M")
o.bind("SUPER + SHIFT + M", "Music", { launch = "lollypop", focus = "lollypop" })

-- hyprwhspr speech-to-text: press once to start, again to stop.
-- Installed by `yay -S hyprwhspr` (see arch_additional in the Makefile).
o.bind("SUPER + ALT + D", "Speech-to-text", "/usr/lib/hyprwhspr/config/hyprland/hyprwhspr-tray.sh record")
