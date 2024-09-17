return {
	"neovim/nvim-lspconfig",
	ft={ "lua", "python", "sh", "gitcommit", "tex", "markdown", "yaml.docker-compose" },
	config = function ()

		local lsp = require ("lspconfig")
		local coq = require ("coq")

		--need package "lua-language-server" instealled.
		lsp.lua_ls.setup(coq.lsp_ensure_capabilities({
			cmd = {"lua-language-server", "--locale=zh-cn"},
			settings = {
				Lua = {
					runtime = {
						version = "Lua 5.4"
					},
					completion = {
						enable = true,
						callSnippet = "Both",
						keywordSnippet = "Both",
						showWord = "Enable",
					},
					hint = {
						enable = true,
						setType = true,
					},
					workspace = {
						checkThirdParty = "Disable",
						library = {
							vim.env.VIMRUNTIME,
						}
					}
				}
			}
		}))

		--need package "pyright" instealled.
		lsp.pyright.setup(coq.lsp_ensure_capabilities({
			settings = {
				python = {
					analysis = {
						autoImportCompletions = true,
						autoSearchPaths = true,
						diagnosticMode = "openFilesOnly",
						useLibraryCodeForTypes = true,
					}
				}
			}
		}))

		--need package "bash-language-server" instealled.
		lsp.bashls.setup(coq.lsp_ensure_capabilities({}))

		--need package "ltex-ls-bin" instealled.
		lsp.ltex.setup(coq.lsp_ensure_capabilities({
			settings = {
				ltex = {
					language = "en",
					checkFrequency = "save",
				},
			},
		}))

		--need package "texlab" instealled.
		lsp.texlab.setup(coq.lsp_ensure_capabilities({
			settings = {
				texlab = {
					build = {
						executable = "xelatex",
						args = {},
					}
				},
			}
		}))

		--need package "nodejs-compose-language-service" instealled
		lsp.docker_compose_language_service.setup(coq.lsp_ensure_capabilities({}))
	end,

}
