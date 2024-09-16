local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- config.font = wezterm.font("JetBrainsMono Nerd Font")
-- config.font = wezterm.font("ZedMono Nerd Font")
-- config.font = wezterm.font("Hack Nerd Font")
config.font = wezterm.font("BlexMono Nerd Font")
-- config.font = wezterm.font("FiraCode Nerd Font")
config.font_size = 14.05

config.color_scheme = "Catppuccin Macchiato"

config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false

return config
