return{
	"nvim-treesitter/nvim-treesitter",
	-- need package "tree-sitter-cli" installed.
	lazy = false,
	build = ":TSUpdate",
	config = function ()
		require'nvim-treesitter.configs'.setup {
			ensure_installed = "all",
			sync_install = false,
			auto_install = true,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = true,
			}
		}

	end

}
