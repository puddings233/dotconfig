return {
	"neovim/nvim-lspconfig",
	dependencies = {
		-- if ":COQdeps" failed, you can "cd" to install directory of COQ and run "python3 -m coq deps"
    { "ms-jpq/coq_nvim", branch = "coq" },
    { 'ms-jpq/coq.thirdparty', branch = "3p" }
  },

	init = function ()
		vim.g.coq_settings = { auto_start = "shut-up" }
	end,

	config = function ()
		-- coq settings
		vim.g.coq_settings = {
			xdg = true,
			keymap = {
				recommended = false,
				jump_to_mark = "<c-e>",
			}
		}

		-- coq keymaps
		local coq_keymap = {
			{ key = '<Tab>',	func = 'pumvisible() ? "\\<C-n>" : "\\<Tab>"' },
			{ key = '<S-Tab>',	func = 'pumvisible() ? "\\<C-p>" : "\\<BS>"' },
			{ key = '<CR>',	func = 'pumvisible() ? (complete_info().selected == -1 ? "\\<C-e><CR>" : "\\<C-y>") : "\\<CR>"' },
		}
		for _, mapping in ipairs(coq_keymap) do
			vim.keymap.set("i", mapping.key, mapping.func, { noremap = true, silent = true, expr = true });
		end

		-- coq 3p settings
		require("coq_3p") {
			{ src = "bc", short_name = "MATH", precision = 6 },
		}

		-- lsp settings
		local lsp = require ("lspconfig")
		local coq = require ("coq")

		-- need package "lua-language-server" instealled.
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

		-- need package "pyright" instealled.
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

		-- need package "bash-language-server" instealled.
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

		-- need package "texlab" instealled.
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

		-- need package "nodejs-compose-language-service" instealled
		lsp.docker_compose_language_service.setup(coq.lsp_ensure_capabilities({}))
	end,
}