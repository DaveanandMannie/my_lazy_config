-- need to to set env var WEZTERM_CONFIG_FILE to this file
--FOR THE THE LOVE OF GOD READ THIS DAVE
local wezterm = require("wezterm")
local config = wezterm.config_builder()
-- workspace dir default
config.default_cwd = "C:/Users/support/workspace"
-- default term prog can be changed with cli args
config.default_prog = { "C:/Program Files/PowerShell/7/pwsh.exe", "-nologo" }

--styles
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }
config.font = wezterm.font("JetBrains Mono", { weight = "Bold" })
config.color_scheme = "Sakura"
config.window_padding = {
  left = "0.5cell",
  right = "0.5cell",
  top = "0cell",
  bottom = "0cell",
}

--tab bar
config.hide_tab_bar_if_only_one_tab = true

--window size
config.initial_rows = 32
config.initial_cols = 129

--tansparent
local is_transparent = true
config.window_background_opacity = 0.8
config.text_background_opacity = 0.2

--key map
local act = wezterm.action
config.keys = {
  { key = "l", mods = "ALT", action = act.ActivateTabRelative(1) },
  { key = "h", mods = "ALT", action = act.ActivateTabRelative(-1) },
  { key = "f", mods = "ALT", action = act.ToggleFullScreen },
  -- Keybinding to toggle transparency
  {
    key = "o",
    mods = "ALT|CTRL",
    action = wezterm.action_callback(function(window)
      if is_transparent then
        -- Set to solid
        window:set_config_overrides({
          window_background_opacity = 1.0,
          text_background_opacity = 1.0,
        })
        is_transparent = false
      else
        -- Set to transparent
        window:set_config_overrides({
          window_background_opacity = 0.8,
          text_background_opacity = 0.2,
        })
        is_transparent = true
      end
    end),
  },
}

return config
