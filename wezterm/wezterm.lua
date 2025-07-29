local wezterm = require 'wezterm'
local config = {
  font = wezterm.font 'Hack Nerd Font',
  font_size = 11.0,
  color_scheme = 'Dracula (Official)',
  tab_bar_at_bottom = false,
  use_fancy_tab_bar = false,
  window_decorations = "RESIZE",
  default_prog = { 'wsl', '~', '-d', 'Ubuntu-20.04' },
  window_background_opacity = .99,
  automatically_reload_config = true,
  check_for_updates = true,
  default_cursor_style = "BlinkingBlock",
  disable_default_key_bindings = false,
  hide_tab_bar_if_only_one_tab = true,
  enable_tab_bar = true,
  keys = {
    {
      key = 'm',
      mods = 'CTRL',
      action = wezterm.action.DisableDefaultAssignment,
    },
  },
}


if string.find(wezterm.target_triple, "windows") then
  -- Apply Windows-specific configurations here
  config.default_prog = { "pwsh.exe" }   -- Example: Set default shell to PowerShell on Windows
  print("WezTerm is running on Windows.")
else
  -- Apply configurations for other operating systems
  config.default_prog = { "zsh" }   -- Example: Set default shell to bash on non-Windows
  print("WezTerm is running on a non-Windows OS.")
end

return config
