return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter").setup({})

			vim.api.nvim_create_autocmd("FileType", {
				callback = function(ev)
					local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(ev.buf))
					if ok and stats and stats.size > 100 * 1024 then
						return
					end
					pcall(vim.treesitter.start)
					vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				end,
			})

			-- ensure_installed
			local ensure_installed = {
				"bash",
				"c",
				"diff",
				"html",
				"lua",
				"luadoc",
				"markdown",
				"markdown_inline",
				"query",
				"vim",
				"vimdoc",
				"yaml",
				"json",
				"javascript",
				"tsx",
				"css",
				"scss",
				"go",
				"python",
				"rust",
				"sql",
			}
			local already = require("nvim-treesitter.config").get_installed()
			local to_install = vim.iter(ensure_installed)
				:filter(function(p)
					return not vim.tbl_contains(already, p)
				end)
				:totable()
			if #to_install > 0 then
				require("nvim-treesitter").install(to_install)
			end
		end,
	},
	{ "nvim-treesitter/nvim-treesitter-textobjects", lazy = false },
}
