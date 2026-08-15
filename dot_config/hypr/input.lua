-- Personal input overrides for Omarchy 4 ("Quarto").
-- Loaded by ~/.config/hypr/hyprland.lua via require("hypr.input"), after
-- Omarchy's defaults, so the keys set here win.
--
-- NOTE: the old ~/.config/hypr/input.conf is dead under Quarto. Nothing
-- sources .conf files any more; only the .lua files are required.

hl.config({
  input = {
    -- UK layout plus Greek. The Alt + Shift toggle lives in hypr/bindings.lua,
    -- not here -- see the long comment on kb_options below.
    --
    -- Order matters: Hyprland resolves keybindings against the FIRST entry in
    -- kb_layout, not the active layout. Greek is non-Latin, so leading with it
    -- would break every SUPER + <letter> binding. Keep "gb" first.
    kb_layout = "gb,gr",

    -- compose:caps                -> Caps Lock acts as the compose key (Omarchy default)
    -- shift:both_capslock_cancel  -> both Shifts together = Caps Lock (Omarchy default)
    --
    -- grp:alt_shift_toggle is deliberately NOT here. It and
    -- shift:both_capslock_cancel both redefine <LFSH>/<RTSH>, and the shift
    -- option wins in the compiled keymap:
    --
    --   key <LFSH> { type= "ALPHABETIC", symbols[1]= [ Shift_L, Caps_Lock ] };
    --
    -- so the Shift half of the toggle is gone. Only <LALT> keeps its
    -- ISO_Next_Group, which means the switch fires on Shift-then-Alt and does
    -- nothing on Alt-then-Shift -- which is how most people press it. It also
    -- switches only the one device that saw the keypress, so a keyboard that
    -- presents several endpoints (Keychron V3 Max) ends up half-Greek.
    --
    -- Verify with:
    --   xkbcli compile-keymap --layout gb,gr --options "<the string above>"
    kb_options = "compose:caps,shift:both_capslock_cancel",
  },
})
