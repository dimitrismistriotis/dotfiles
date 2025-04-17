local wezterm = require 'wezterm'

home=os.getenv( "HOME" )

local config = {
  initial_rows = 50,
  initial_cols = 100,

--  font = wezterm.font('Hack Nerd Font', { weight = 'Regular' }),
  font_size = 12,
  color_scheme = 'Tokyo Night (Gogh)',
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
  default_prog = { '/usr/bin/fish', '-l' },

  keys = {
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
  },
}

return config
