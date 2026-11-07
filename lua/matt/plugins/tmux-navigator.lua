-- ctrl+h/j/k/l fra le finestre di nvim e, arrivati al bordo, fra i pannelli del multiplexer.
-- In tmux lo fa vim-tmux-navigator; in herdr (che non lo conosce) queste mappe: herdr passa
-- il tasto a nvim (~/scripts/herdr-nav nei dotfiles) e nvim, se non c'è una finestra più in
-- là, chiede a herdr di spostare il fuoco.
local herdr = vim.env.HERDR_PANE_ID ~= nil and vim.env.TMUX == nil

if herdr then
	local dirs = { h = "left", j = "down", k = "up", l = "right" }
	for key, dir in pairs(dirs) do
		vim.keymap.set("n", "<C-" .. key .. ">", function()
			local win = vim.api.nvim_get_current_win()
			vim.cmd.wincmd(key)
			if vim.api.nvim_get_current_win() == win then
				vim.system({ "herdr", "pane", "focus", "--direction", dir, "--pane", vim.env.HERDR_PANE_ID })
			end
		end, { desc = "Window or herdr pane " .. dir })
	end
end

return {
	{
		"christoomey/vim-tmux-navigator",
		cond = not herdr,
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
			"TmuxNavigatePrevious",
			"TmuxNavigatorProcessList",
		},
		keys = {
			{ "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
			{ "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
			{ "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
			{ "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
			{ "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
		},
	},
}
