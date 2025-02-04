local wezterm = require("wezterm")
local config = {}

config.max_fps = 120

config.font = wezterm.font_with_fallback({
	{ family = "JetBrainsMono NF" },
	{ family = "Source Han Sans" },
})

config.font_rules = {
	{
		italic = false,
		intensity = "Bold",
		font = wezterm.font({
			family = "JetBrainsMono NF",
			weight = "Bold",
		}),
	},
	{
		italic = false,
		intensity = "Bold",
		font = wezterm.font({
			family = "JetBrainsMono NF",
			-- family = "Jetbrains Mono",
			weight = "Bold",
		}),
	},
	{
		italic = false,
		intensity = "Half",
		font = wezterm.font({
			family = "JetBrainsMono NF",
			-- family = "Jetbrains Mono",
			weight = "DemiBold",
		}),
	},
	{
		italic = false,
		intensity = "Normal",
		font = wezterm.font({
			family = "JetBrainsMono NF",
			-- family = "Jetbrains Mono",
			weight = "Regular",
		}),
	},
	{
		intensity = "Bold",
		italic = true,
		font = wezterm.font({
			family = "Operator Mono Book",
			weight = "Bold",
			style = "Italic",
		}),
	},
	{
		italic = true,
		intensity = "Half",
		font = wezterm.font({
			family = "Operator Mono Book",
			weight = "DemiBold",
			style = "Italic",
		}),
	},
	{
		italic = true,
		intensity = "Normal",
		font = wezterm.font({
			family = "Operator Mono Book",
			style = "Italic",
		}),
	},
}

config.window_padding = {
	left = "0.25cell",
	right = "0.25cell",
	top = "0.25cell",
	bottom = "0.25cell",
}

config.window_frame = {
	border_left_width = "0cell",
	border_right_width = "0cell",
	border_bottom_height = "0cell",
	border_top_height = "0cell",
	border_left_color = "NONE",
	border_right_color = "NONE",
	border_bottom_color = "NONE",
	border_top_color = "NONE",
}
config.window_decorations = "NONE"
config.cursor_blink_rate = 0
config.colors = {
	-- The default text color
	foreground = "#dfdcd8",
	-- The default background color
	background = "#121212",

	-- Overrides the cell background color when the current cell is occupied by the
	-- cursor and the cursor style is set to Block
	--
	cursor_bg = "#dfdcd8",
	-- Overrides the text color when the current cell is occupied by the cursor
	cursor_fg = "#000000",
	-- Specifies the border color of the cursor when the cursor style is set to Block,
	-- or the color of the vertical or horizontal bar when the cursor style is set to
	-- Bar or Underline.
	cursor_border = "#eaffea",

	-- the foreground color of selected text
	selection_fg = "#dfdcd8",
	-- the background color of selected text
	selection_bg = "#404040",

	-- The color of the scrollbar "thumb"; the portion that represents the current viewport
	scrollbar_thumb = "#222222",

	-- The color of the split lines between panes
	split = "#444444",

	brights = {
		"#444444",
		"#ff2740",
		"#9ece6a",
		"#f4bf75",
		"#4fc1ff",
		"#fc317e",
		"#62d8f1",
		"#dfdcd8",
	},
	ansi = {
		"#121212",
		"#ff2740",
		"#9ece6a",
		"#f4bf75",
		"#4fc1ff",
		"#fc317e",
		"#62d8f1",
		"#dfdcd8",
	},

	-- Arbitrary colors of the palette in the range from 16 to 255
	indexed = { [136] = "#af8700" },

	-- Since: 20220319-142410-0fcdea07
	-- When the IME, a dead key or a leader key are being processed and are effectively
	-- holding input pending the result of input composition, change the cursor
	-- to this color to give a visual cue about the compose state.
	compose_cursor = "orange",

	-- Colors for copy_mode and quick_select
	-- available since: 20220807-113146-c2fee766
	-- In copy_mode, the color of the active text is:
	-- 1. copy_mode_active_highlight_* if additional text was selected using the mouse
	-- 2. selection_* otherwise
	copy_mode_active_highlight_bg = { Color = "#000000" },
	-- use `AnsiColor` to specify one of the ansi color palette values
	-- (index 0-15) using one of the names "Black", "Maroon", "Green",
	--  "Olive", "Navy", "Purple", "Teal", "Silver", "Grey", "Red", "Lime",
	-- "Yellow", "Blue", "Fuchsia", "Aqua" or "White".
	copy_mode_active_highlight_fg = { AnsiColor = "Black" },
	copy_mode_inactive_highlight_bg = { Color = "#52ad70" },
	copy_mode_inactive_highlight_fg = { AnsiColor = "White" },

	quick_select_label_bg = { Color = "peru" },
	quick_select_label_fg = { Color = "#dfdcd8" },
	quick_select_match_bg = { AnsiColor = "Navy" },
	quick_select_match_fg = { Color = "#dfdcd8" },
}

config.font_size = 11.0
config.enable_tab_bar = false

--[[ config.window_frame = {
  -- The font used in the tab bar.
  -- Roboto Bold is the default; this font is bundled
  -- with wezterm.
  -- Whatever font is selected here, it will have the
  -- main font setting appended to it to pick up any
  -- fallback fonts you may have used there.
  font = wezterm.font { family = 'Roboto', weight = 'Bold' },

  -- The size of the font in the tab bar.
  -- Default to 10.0 on Windows but 12.0 on other systems
  font_size = 10.0,

  -- The overall background color of the tab bar when
  -- the window is focused
  active_titlebar_bg = '#333333',

  -- The overall background color of the tab bar when
  -- the window is not focused
  inactive_titlebar_bg = '#333333',
} ]]

config.window_background_opacity = 0.70
config.hide_mouse_cursor_when_typing = false

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
--[[ if wezterm.config_builder then
  config = wezterm.config_builder()
end ]]

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- config.color_scheme = 'AdventureTime'

-- and finally, return the configuration to wezterm
--
config.keys = {
	-- Turn off the default CMD-m Hide action, allowing CMD-m to
	-- be potentially recognized and handled by the tab
	{
		key = "Enter",
		mods = "ALT",
		action = "DisableDefaultAssignment",
	},
}

return config
