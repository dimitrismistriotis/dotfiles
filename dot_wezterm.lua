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

config.font = wezterm.font('FiraCode Nerd Font', { weight = 'Regular' })
config.font_size = 12
config.color_scheme = 'Tokyo Night (Gogh)'
--   background = {
--     {
--       source = {
--         File = home .."/Pictures/terminal_wallpaper.jpg",
--       },
--       -- opacity = 0.3,
--       brightness = 0.3,
--     },
--   },
--     -- Darken the background image by reducing it to 1/3rd
--     brightness = 0.3,
-- 
--     -- You can adjust the hue by scaling its value.
--     -- a multiplier of 1.0 leaves the value unchanged.
--     hue = 1.0,
-- 
--     -- You can adjust the saturation also.
--     saturation = 1.0,
--   }

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
  }

return config
