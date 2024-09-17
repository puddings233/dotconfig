return{
	"hedyhli/outline.nvim",
	keys = {
		{ '<C-l>', ':Outline<CR>', noremap = true },
	},
	config = function ()

		require("outline").setup {
		--Your setup opts here (leave empty to use defaults)
			keymaps = {
				show_help = '?',
				close = 'Q',
				goto_location = nil,
				peek_location = '<CR>',
				goto_and_close = nil,
				restore_location = nil,
				hover_symbol = nil,
				toggle_preview = '<Tab>',
				rename_symbol = nil,
				code_actions = nil,
				fold = nil,
				unfold = nil,
				fold_toggle = '<S-Tab>',
				fold_toggle_all = nil,
				fold_all = nil,
				unfold_all = nil,
				fold_reset = nil,
				down_and_jump = nil,
				up_and_jump = nil,
			},
			roviders = {
				priority = { 'lsp', 'coq', 'markdown',},
			}
		}

	end,

}
