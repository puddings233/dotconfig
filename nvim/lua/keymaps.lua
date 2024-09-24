local mappings = {

	-- disable arrow keys
	{ key = '<up>',	func = '',	mod = { 'n', 'i' } },
	{ key = '<right>',	func = '',	mod = { 'n', 'i' } },
	{ key = '<down>',	func = '',	mod = { 'n', 'i' } },
	{ key = '<left>',	func = '',	mod = { 'n', 'i' } },
	{ key = '<right>',	func = '',	mod = { 'n', 'i' } },

	-- remap movements
	{ key = 'u',	func = 'k',		mod = { 'n', 'v' } },
	{ key = 'k',	func = 'l',		mod = { 'n', 'v' } },
	{ key = 'l',	func = '',		mod = { 'n', 'v' } },
	{ key = 'LL',	func = 'u',		mod = 'n' },
	{ key = 'U',	func = '5k',		mod = { 'n', 'v' } },
	{ key = 'H',	func = '5h',		mod = { 'n', 'v' } },
	{ key = 'J',	func = '5j',		mod = { 'n', 'v' } },
	{ key = 'K',	func = '5l',		mod = { 'n', 'v' } },
	{ key = 'S',	func = ':w<CR>',	mod = 'n' },

	-- tab control
	{ key = "th",	func = ':-tabnext<CR>',	mod = 'n' },
	{ key = "tk",	func = ':+tabnext<CR>',	mod = 'n' },

	-- quit
	{ key = 'Q', func = ':lua quit_or_delete_buffer()<CR>', mod = 'n' },

	-- plugins
	{ key = 'MDP',		func = '<Plug>MarkdownPreview',						mod = 'n' },
	{ key = 'COQ',		func = ':COQnow<CR>',							mod = 'n' },
	{key = '<C-f>',	func = ':lua require"joshuto".joshuto({ edit_in_tab = true })<CR>', mod = 'n' },

};

for _, mapping in ipairs(mappings) do
	vim.keymap.set(mapping.mod, mapping.key, mapping.func, {noremap = true});
end
