return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		-- Import mason
		local mason = require("mason")

		-- Import mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")

		local mason_tool_installer = require("mason-tool-installer")

		-- Enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			-- List of servers for mason to install
			ensure_installed = {
				"ts_ls",
				"html",
				"cssls",
				"tailwindcss",
				"sqlls",
				"rust_analyzer",
				"bashls",
				"svelte",
				"marksman",
				"lua_ls",
				"gopls",
				"graphql",
				"harper_ls",
				"emmet_ls",
				"prismals",
				"pyright",
				"clangd",
			},
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"prettier", -- prettier formatter
				"sql-formatter", -- sql formatter
				"stylua", -- lua formatter
				"isort", -- python formatter
				"black", -- python formatter
				"pylint", -- python linter
				"eslint_d", -- js linter
				"sonarlint-language-server",
				"npm-groovy-lint",
				"beautysh",
				"clang-format",
				"ast-grep",
				"cpplint",
				"gofumpt",
				"golangci-lint",
			},
		})
	end,
}
