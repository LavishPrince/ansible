return {
	"kristijanhusak/vim-dadbod-ui",
	dependencies = {
		{ "tpope/vim-dadbod", lazy = true },
		{ "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true }, -- Optional
	},
	cmd = {
		"DBUI",
		"DBUIToggle",
		"DBUIAddConnection",
		"DBUIFindBuffer",
	},
	init = function()
		-- Your DBUI configuration
		vim.g.db_ui_use_nerd_fonts = 1 -- Use nerd fonts if available
		vim.g.db_ui_win_position = "right" -- Position the UI on the left side
		vim.g.db_ui_show_database_icon = 1 -- Show database icons

		-- Optional: Customize the UI layout further
		vim.g.db_ui_force_echo_notifications = 1 -- Show notifications
		vim.g.db_ui_winwidth = 20 -- Set the width of the left panel
	end,
}
