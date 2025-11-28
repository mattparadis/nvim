local function enable_transparency()
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
	-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	-- vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
end

-- colorscheme
vim.cmd("colorscheme dracula")

-- lsp hover border visibility
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

-- adds bg to warning

local warn_hl = vim.api.nvim_get_hl(0, { name = "DiagnosticWarn", link = false })
local warn_vt_hl = vim.api.nvim_get_hl(0, { name = "DiagnosticVirtualTextWarn", link = false })

local warn_bg = "#3A2C00"

vim.api.nvim_set_hl(0, "DiagnosticWarn", {
	fg = warn_hl.fg,
	bg = warn_bg,
})

vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", {
	fg = warn_vt_hl.fg,
	bg = warn_bg,
})

enable_transparency()
