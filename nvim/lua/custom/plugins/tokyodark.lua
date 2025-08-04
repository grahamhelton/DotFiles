return {
  {
    'tiagovla/tokyodark.nvim',
    priority = 1000,
    lazy = false,
    config = function()
      -- Simple setup without any custom options first
      vim.cmd.colorscheme 'tokyodark'
    end,
  },
}
