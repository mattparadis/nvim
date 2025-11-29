return {
	"tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically
	{ "nvim-lua/plenary.nvim" },
	{ "folke/todo-comments.nvim", dependencies = { "nvim-lua/plenary.nvim" }, opts = {} },
	{
		"abecodes/tabout.nvim",
		config = function()
			require("tabout").setup({})
		end,
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"L3MON4D3/LuaSnip",
			"hrsh7th/nvim-cmp",
		},
	},
}
