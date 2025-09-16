return {
	require("mason").setup({
		ui = {
			icons = {
				package_installed = "✓",
				package_pending = "➜",
				package_uninstalled = "✗"
			}
		}
	}),
	require("mason-lspconfig").setup({
		ensure_installed = {
			"lua_ls",
			"basedpyright",
			"bashls",
			"rust_analyzer",
			"ltex",
			"texlab",
			"dockerls",
			"docker_compose_language_service",
		},
	})
}
