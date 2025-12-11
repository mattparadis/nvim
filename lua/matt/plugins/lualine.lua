return {
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("lualine").setup({
				options = {
					theme = "dracula",
					globalstatus = true,
					section_separators = "",
					component_separators = { left = "", right = "|" },
				},
			})
		end,
	},
}
