local wezterm = require 'wezterm'
-- This will hold the configuration.
local config = wezterm.config_builder()

home=os.getenv( "HOME" )


config.initial_rows = 50
config.initial_cols = 100
config.window_decorations = "TITLE | RESIZE"  -- Default for reference
-- Thin on left, larger scrollbar:
config.window_padding = {
  left = '0.5cell',
  right = '1.25cell', -- right: size of scrollbar
  top = '0.5cell',
  bottom = '0.5cell',
}

--
-- Font
--
config.font = wezterm.font('FiraCode Nerd Font', { weight = 'Regular' })
config.font_size = 12

--
-- Theme
--
config.color_scheme = 'Tokyo Night (Gogh)'
--
-- This should have a if-file-exists check:
--
config.window_background_image = home .."/dotfiles/images/gradient-particle-wave-background_45176454.jpg"
config.window_background_image_hsb = {
  --
  -- Darken the background image
  --
  brightness = 0.02,

  -- You can adjust the hue by scaling its value.
  -- a multiplier of 1.0 leaves the value unchanged.
  hue = 1.0,

  -- You can adjust the saturation also.
  saturation = 1.0,
}
-- config.text_background_opacity = 0.9

-- Spawn a fish shell in login mode
config.default_prog = { '/usr/bin/fish', '-l' }

config.keys = {
    -- Keybindings:
    {
      key = "\\",
      mods = "CTRL",
      action = wezterm.action.SplitHorizontal,
    },
    {
      key = "-",
      mods = "CTRL",
      action = wezterm.action.SplitVertical,
    },
    {
      key="\"",
      mods="CTRL|SHIFT",
      action=wezterm.action.ActivateTab(1),
    },
    {
      key = "UpArrow",
      mods="CTRL|SHIFT",
      action = wezterm.action.ActivatePaneDirection("Up"),
    },
    {
      key = "DownArrow",
      mods="CTRL|SHIFT",
      action = wezterm.action.ActivatePaneDirection("Down"),
    },
    {
      key = "LeftArrow",
      mods="CTRL|SHIFT",
      action = wezterm.action.ActivatePaneDirection("Left"),
    },
    {
      key = "RightArrow",
      mods="CTRL|SHIFT",
      action = wezterm.action.ActivatePaneDirection("Right"),
    },
  }

return config
