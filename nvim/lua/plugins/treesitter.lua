return{
	"nvim-treesitter/nvim-treesitter",
	-- need package "tree-sitter-cli" installed.
	build = ":TSUpdate",
	config = function ()
		require'nvim-treesitter'.install {"all"}:wait(300000)
	end
}
