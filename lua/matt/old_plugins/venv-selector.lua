return {
  {
    'linux-cultist/venv-selector.nvim',
    dependencies = {
      'neovim/nvim-lspconfig',
      'mfussenegger/nvim-dap',
      'mfussenegger/nvim-dap-python', --optional
      { 'nvim-telescope/telescope.nvim', dependencies = { 'nvim-lua/plenary.nvim' } },
    },
    lazy = false,
    keys = {
      { '<leader>pe', '<cmd>VenvSelect<cr>', desc = 'Seleziona python venv' },
    },
    ---@type venv-selector.Config
    opts = {
      auto_refresh = true,
      auto_activate_last = true,
    },
  },
}
