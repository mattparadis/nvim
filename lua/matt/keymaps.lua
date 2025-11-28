-- Keymaps

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>") -- Removes searched string with esc

vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Highlight when yanking (copying) text

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Toggle func docs on hover (normal mode)
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "LSP Hover" })

vim.keymap.set("n", "<leader>ee", function()
	vim.diagnostic.jump({ count = 1, float = true })
end, { desc = "Go to next [E]rror" })

vim.keymap.set("n", "<leader>EE", function()
	vim.diagnostic.jump({ count = -1, float = true })
end, { desc = "Go to prev [E]rror" })

vim.keymap.set("n", "<leader>pf", "<C-^>", { desc = "Switch to previous buffer" })

vim.keymap.set("n", "<leader>F", function()
	require("mini.files").open(vim.api.nvim_buf_get_name(0))
end, { desc = "MiniFiles in buffer dir" })

vim.keymap.set("n", "<leader>O", ":Oil<CR>", {
	desc = "Open Oil",
	noremap = true,
	silent = true,
})

vim.keymap.set("n", "<leader>ff", ":Telescope flutter commands<CR>", {
	desc = "Flutter commands",
	noremap = true,
	silent = true,
})

vim.keymap.set("n", "<leader>z", function()
	require("snacks.zen")()
end, { desc = "Toggle Snacks Zen" })
