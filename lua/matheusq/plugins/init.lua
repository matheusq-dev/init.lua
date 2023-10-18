return {
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "mattn/emmet-vim",
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {} -- this is equalent to setup({}) function
  },
  {
    'stevearc/oil.nvim',
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
}
