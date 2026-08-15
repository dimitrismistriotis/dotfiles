-- Personal input overrides for Omarchy 4 ("Quarto").
-- Loaded by ~/.config/hypr/hyprland.lua via require("hypr.input"), after
-- Omarchy's defaults, so the keys set here win.
--
-- NOTE: the old ~/.config/hypr/input.conf is dead under Quarto. Nothing
-- sources .conf files any more; only the .lua files are required.

hl.config({
  input = {
    -- UK layout plus Greek, toggled with Alt + Shift.
    --
    -- Order matters: Hyprland resolves keybindings against the FIRST entry in
    -- kb_layout, not the active layout. Greek is non-Latin, so leading with it
    -- would break every SUPER + <letter> binding. Keep "gb" first.
    kb_layout = "gb,gr",

    -- compose:caps                -> Caps Lock acts as the compose key (Omarchy default)
    -- shift:both_capslock_cancel  -> both Shifts together = Caps Lock (Omarchy default)
    -- grp:alt_shift_toggle        -> Alt + Shift cycles gb <-> gr
    kb_options = "compose:caps,shift:both_capslock_cancel,grp:alt_shift_toggle",
  },
})
