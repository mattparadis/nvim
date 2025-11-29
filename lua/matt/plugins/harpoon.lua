return {
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local harpoon = require("harpoon")
			harpoon:setup({})

			local conf = require("telescope.config").values
			local function toggle_telescope(harpoon_files)
				local file_paths = {}
				for _, item in ipairs(harpoon_files.items) do
					table.insert(file_paths, item.value)
				end

				require("telescope.pickers")
					.new({}, {
						prompt_title = "Harpoon",
						finder = require("telescope.finders").new_table({
							results = file_paths,
						}),
						previewer = conf.file_previewer({}),
						sorter = conf.generic_sorter({}),
					})
					:find()
			end

			vim.keymap.set("n", "<leader>h", function()
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end, { desc = "Open [H]arpoon window" })

			vim.keymap.set("n", "<leader>ht", function()
				toggle_telescope(harpoon:list())
			end, { desc = "Open [H]arpoon in [T]elescope" })

			vim.keymap.set("n", "<leader>ha", function()
				harpoon:list():add()
				vim.notify("File " .. vim.fn.expand("%:t") .. " added to Harpoon")
			end, { desc = "[A]dd current file to harpoon" })

			vim.keymap.set("n", "<leader>hr", function()
				harpoon:list():remove()
				vim.notify("File " .. vim.fn.expand("%:t") .. " removed from Harpoon")
			end, { desc = "[R]emove current file from harpoon" })

			vim.keymap.set("n", "<leader>hc", function()
				harpoon:list():clear()
				vim.notify("Harpoon Files cleared")
			end, { desc = "[C]lear all files from harpoon" })

			vim.keymap.set("n", "<leader>1", function()
				harpoon:list():select(1)
			end, { desc = "Harpoon [1] file" })
			vim.keymap.set("n", "<leader>2", function()
				harpoon:list():select(2)
			end, { desc = "Harpoon [2] file" })
			vim.keymap.set("n", "<leader>3", function()
				harpoon:list():select(3)
			end, { desc = "Harpoon [3] file" })
			vim.keymap.set("n", "<leader>4", function()
				harpoon:list():select(4)
			end, { desc = "Harpoon [4] file" })

			-- Toggle previous & next buffers stored within Harpoon list
			vim.keymap.set("n", "<leader>ph", function()
				harpoon:list():prev()
			end, { desc = "Go to [P]revious [H]arpoon file" })
			vim.keymap.set("n", "<leader>nh", function()
				harpoon:list():next()
			end, { desc = "Go to [N]ext [H]arpoon file" })
		end,
	},
}
