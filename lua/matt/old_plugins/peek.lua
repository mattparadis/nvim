return {
  {
    "toppair/peek.nvim",
    event = { "VeryLazy" },
    build = "deno task --quiet build:fast",
    config = function()
      require("peek").setup({
        auto_load = true,         -- auto-preview quando entri in un file markdown
        close_on_bdelete = true,  -- chiudi la preview quando chiudi il buffer
        syntax = true,            -- abilita evidenziazione sintattica
        theme = 'dark',           -- 'dark' o 'light'
        update_on_change = true,  -- aggiorna live
        app = 'browser',          -- oppure 'browser'
        filetype = { 'markdown' },
        throttle_at = 200000,
        throttle_time = 'auto',
      })

      -- Comandi personalizzati per aprire/chiudere la preview
      vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
      vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
    end,
  },
}

