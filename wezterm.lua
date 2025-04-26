--WARNING: need to to set env var WEZTERM_CONFIG_FILE to this file
local wezterm = require("wezterm")
local config = wezterm.config_builder()
-- workspace dir default
config.default_cwd = os.getenv("HOMEPATH") .. "/workspace"
-- default term prog can be changed with cli args
config.default_prog = { "pwsh" }

--styles
config.harfbuzz_features = { "calt=1", "clig=1", "liga=1" }
config.font = wezterm.font("JetBrainsMono NF", { weight = "Bold" , style = "Italic"})
-- config.font_size = 14
config.color_scheme = "Sakura"
config.window_padding = {
  left = "0.5cell",
  right = "0.5cell",
  top = "0cell",
  bottom = "0cell",
}

--tab bar
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true

--window size
config.initial_rows = 32
config.initial_cols = 129

--tansparent
local is_transparent = true
config.window_background_opacity = 0.65
config.text_background_opacity = 0.4

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
          window_background_opacity = 0.65,
          text_background_opacity = 0.4,
        })
        is_transparent = true
      end
    end),
  },
}

return config
