return {
  'supermaven-inc/supermaven-nvim',
  config = function()
    require('supermaven-nvim').setup {
      keymaps = {
        accept_suggestion = '<M-y>',
        clear_suggestion = '<M-e>',
        accept_word = '<M-w>',
      },
      disable_inline_completion = false,
    }
  end,
}
