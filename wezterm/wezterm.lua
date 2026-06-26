local wezterm = require 'wezterm'
local act = wezterm.action

local config = {
	enable_wayland = true,
	front_end = 'WebGpu',

	enable_tab_bar = false,
	enable_scroll_bar = false,

	window_decorations= 'NONE',
	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},

	font_size = 15.0,
	color_scheme = 'Gruvbox Dark (Gogh)',
	font = wezterm.font_with_fallback ({
		{ family = 'Maple Mono Custom NL', weight = 450 },
		{ family = 'Sarasa Mono SC', weight = 'Regular' },
		{ family = 'Symbols Nerd Font Mono', weight = 'Regular' },
		{ family = 'Blobmoji', weight = 'Regular' },
	}),

	disable_default_key_bindings = true,
	keys = {
		{ key = 'V', mods = 'CTRL', action = act.ActivateCopyMode },
		{ key = 'I', mods = 'CTRL', action = act.ShowDebugOverlay }
	},
	key_tables = {
		copy_mode = {
			{ key = 'h', mods = 'NONE', action = act.CopyMode 'MoveLeft' },
			{ key = 'j', mods = 'NONE', action = act.CopyMode 'MoveDown' },
			{ key = 'u', mods = 'NONE', action = act.CopyMode 'MoveUp' },
			{ key = 'k', mods = 'NONE', action = act.CopyMode 'MoveRight' },
			{ key = '0', mods = 'NONE', action = act.CopyMode 'MoveToStartOfLine' },
			{ key = '$', mods = 'SHIFT', action = act.CopyMode 'MoveToEndOfLineContent'},
			{ key = 'v', mods = 'NONE', action = act.CopyMode { SetSelectionMode = 'Cell' }},
			{ key = 'V', mods = 'NONE', action = act.CopyMode { SetSelectionMode = 'Line' }},
			{ key = 'V', mods = 'CTRL', action = act.CopyMode { SetSelectionMode = 'Block' }},
			{ key = 'u', mods = 'SHIFT', action = act.CopyMode { MoveByPage = -0.5 }},
			{ key = 'j', mods = 'SHIFT', action = act.CopyMode { MoveByPage = 0.5 }},
			{ key = 'Escape', mods = 'NONE', action = act.CopyMode 'Close' },
			{ key = 'y', mods = 'NONE', action = act.Multiple {
				{ CopyTo = 'ClipboardAndPrimarySelection' },
				{ CopyMode = 'MoveToScrollbackBottom' },
				{ CopyMode = 'Close' }
			}}
		}
	}
}

return config
