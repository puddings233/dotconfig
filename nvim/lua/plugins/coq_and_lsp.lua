return {
	"neovim/nvim-lspconfig",
	dependencies = {
		-- if ":COQdeps" failed, you can "cd" to install directory of COQ and run "python3 -m coq deps"
		{ "ms-jpq/coq_nvim", branch = "coq" },
		{ "ms-jpq/coq.artifacts", branch = "artifacts" },
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
		local coq = require "coq"

		vim.lsp.config("lua_ls", coq.lsp_ensure_capabilities({
			on_init = function(client)
				if client.workspace_folders then
					local path = client.workspace_folders[1].name
					if
						path ~= vim.fn.stdpath("config")
						and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc"))
					then
						return
					end
				end
				client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
					runtime = {
						version = "LuaJIT",
						path = {
							"lua/?.lua",
							"lua/?/init.lua",
						},
					},
					workspace = {
						checkThirdParty = false,
						library = {
							vim.env.VIMRUNTIME,
						},
					},
				})
			end,
			settings = {
				Lua = {
					runtime = {
						version = "LuaJIT"
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
					}
				},
			},
			cmd = {"lua-language-server", "--locale=zh-cn"}
		}))

		vim.lsp.config("basedpyright", coq.lsp_ensure_capabilities({
			cmd_env = {LANG = "zh-cn"},
			cmd = {"basedpyright-langserver", "--stdio"},
			settings = {
				basedpyright = {
					analysis = {
						typeCheckingMode = "standard",
						autoImportCompletions = true,
						autoSearchPaths = true,
						diagnosticMode = "openFilesOnly",
						useLibraryCodeForTypes = true,
					}
				}
			}
		}))

		vim.lsp.config("rust_analyzer", coq.lsp_ensure_capabilities({
			settings = {
				['rust-analyzer'] = {
					diagnostics = {
						enable = false;
					},
					procMacro = {
						enable = true;
					}
				}
			}
		}))

		vim.lsp.config("bash_ls", coq.lsp_ensure_capabilities({}))

		vim.lsp.config("dockerls", coq.lsp_ensure_capabilities({}))

		vim.lsp.config("docker_compose_language_service", coq.lsp_ensure_capabilities({}))
	end
}
