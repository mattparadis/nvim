return {
  'nvim-flutter/flutter-tools.nvim',
  lazy = false,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
  },
  config = function()
    require('flutter-tools').setup {}
    pcall(function()
      require('telescope').load_extension 'flutter'
    end)
  end,
}
