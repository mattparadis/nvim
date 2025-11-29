return {

	{ -- Collection of various small independent plugins/modules
		"echasnovski/mini.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		config = function()
			local ai = require("mini.ai")

			local function safe_ts(spec, fallback)
				local ok, gen = pcall(ai.gen_spec.treesitter, spec)
				return ok and gen or fallback
			end

			ai.setup({

				n_lines = 500,
				custom_textobjects = {
					-- vaf / vif  -> definizione funzione (tutta / solo corpo)
					f = safe_ts(
						{ a = "@function.outer", i = "@function.inner" },
						ai.gen_spec.pair("{", "}", { type = "balanced" })
					),
					-- vaF / iF   -> argomenti di una CALL
					F = safe_ts(
						{ a = "@call.inner", i = "@call.inner" },
						ai.gen_spec.pair("(", ")", { type = "balanced" })
					),
					c = safe_ts({ a = "@class.outer", i = "@class.inner" }),
					B = safe_ts(
						{ a = "@block.outer", i = "@block.inner" },
						ai.gen_spec.pair("{", "}", { type = "balanced" })
					),
					s = safe_ts({ a = "@conditional.outer", i = "@conditional.inner" }),
					l = safe_ts({ a = "@loop.outer", i = "@loop.inner" }),
					a = safe_ts({ a = "@parameter.outer", i = "@parameter.inner" }),
				},
			})
			-- Add/delete/replace surroundings (brackets, quotes, etc.)
			-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
			-- - sd'   - [S]urround [D]elete [']quotes
			-- - sr)'  - [S]urround [R]eplace [)] [']
			require("mini.surround").setup()
		end,
	},
	{
		"echasnovski/mini.icons",
		version = false,
		config = function()
			require("mini.icons").setup({})
			MiniIcons.mock_nvim_web_devicons()
		end,
	},
	{
		"echasnovski/mini.move",
		version = false,
		config = function()
			require("mini.move").setup({
				mappings = {
					-- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
					left = "<M-h>",
					right = "<M-l>",
					down = "<M-j>",
					up = "<M-k>",

					-- Move current line in Normal mode
					line_left = "<M-h>",
					line_right = "<M-l>",
					line_down = "<M-j>",
					line_up = "<M-k>",
				},
			})
		end,
	},
	{
		"echasnovski/mini.files",
		version = false,
		config = function()
			require("mini.files").setup({
				windows = {
					preview = true,
					width_preview = 50,
				},
				options = {
					use_as_default_explorer = false,
				},
			})
		end,
	},
	{
		"nvim-mini/mini.indentscope",
		version = "*",
		event = "VeryLazy",
		config = function()
			require("mini.indentscope").setup({
				draw = { delay = 100 },
				options = { try_as_border = true },
			})
		end,
	},
	{
		"nvim-mini/mini.cursorword",
		version = "*",
		config = function()
			require("mini.cursorword").setup({})
		end,
	},
}
