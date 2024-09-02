-- need to to set env var WEZTERM_CONFIG_FILE to this file
--FOR THE THE LOVE OF GOD READ THIS DAVE
local wezterm = require("wezterm")
local config = wezterm.config_builder()
-- workspace dir default
config.default_cwd = 'C:/Users/support/Desktop/workspace'

--styles
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }
config.font = wezterm.font("JetBrains Mono", { weight = "Bold" })
config.color_scheme = "Sakura"
config.window_padding = {
  left = '2cell',
  right = '2cell',
  top = '1cell',
  bottom = '1cell',
}

--window size
config.initial_rows = 32
config.initial_cols = 129

--tansparent
config.window_background_opacity = 0.8
config.text_background_opacity = 0.2

--key map
local act = wezterm.action
config.keys = {
    { key = 'l', mods = 'ALT', action = act.ActivateTabRelative(1) },
    { key = 'h', mods = 'ALT', action = act.ActivateTabRelative(-1) },
}

return config
