require("lazy").setup({
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "mattn/emmet-vim",
  "nvim-tree/nvim-tree.lua",
  "LunarVim/lunar.nvim",
  "lewis6991/gitsigns.nvim",
  "Wansmer/treesj",
  {
   'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {} -- this is equalent to setup({}) function
  },
  {
   "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  {
    'akinsho/bufferline.nvim',
     dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  {
     'stevearc/oil.nvim',
     opts = {},
     dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  {
    'jinh0/eyeliner.nvim',
    config = function()
      require 'eyeliner'.setup {
        highlight_on_key = true,
        dim = true
      }
    end
  },
})


