local wezterm = require 'wezterm'
return {
  font = wezterm.font 'Hack',
  font_size = 11.0, 
  color_scheme = 'Dracula (Official)',
  tab_bar_at_bottom = false,
  use_fancy_tab_bar = false,
  window_decorations = "RESIZE",
  default_prog = {'wsl', '~', '-d', 'Ubuntu-20.04'},
  window_background_opacity = .99,
  automatically_reload_config = true,
  check_for_updates = true,
  default_cursor_style = "BlinkingBlock",
  disable_default_key_bindings = true,
  hide_tab_bar_if_only_one_tab = true,
  enable_tab_bar = true,
}