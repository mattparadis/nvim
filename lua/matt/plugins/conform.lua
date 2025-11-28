return {

	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },

		keys = {
			{
				"<leader>f",
				function()
					require("conform").format({ async = true, lsp_format = "fallback" })
				end,
				mode = "",
				desc = "[F]ormat buffer",
			},
		},
		opts = {
			notify_on_error = false,

			format_on_save = function(bufnr)
				local enable = {
					go = true,
					python = true,
					lua = true,
					html = true,
					css = true,
					javascript = true,
				}

				if not enable[vim.bo[bufnr].filetype] then
					return nil
				end

				return {
					timeout_ms = 500,
					lsp_format = "fallback",
				}
			end,

			formatters_by_ft = {
				lua = { "stylua" },
				python = { "black" },
				go = { "gofmt" },

				-- FRONTEND
				html = { "prettierd", "prettier", stop_after_first = true },
				css = { "prettierd", "prettier", stop_after_first = true },
				javascript = { "prettierd", "prettier", stop_after_first = true },
			},
		},
	},
}
