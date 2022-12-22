local status, telescope = pcall(require, "telescope")
if (not status) then return end
local actions = require('telescope.actions')
local builtin = require("telescope.builtin")

builtin.symbols{ sources = {'emoji', 'kaomoji', 'gitmoji'} }

local function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

local fb_actions = require "telescope".extensions.file_browser.actions

telescope.setup {
  defaults = {
    file_ignore_patterns = { "node_modules", ".git", "dist" },
    mappings = {
      n = {
        ["q"] = actions.close
      },
    },
  },
  extensions = {
    file_browser = {
      theme = "dropdown",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        -- your custom insert mode mappings
        ["i"] = {
          ["<C-w>"] = function() vim.cmd('normal vbd') end,
        },
        ["n"] = {
          -- your custom normal mode mappings

          ["<C-v>"] = fb_actions.copy,
          ["<C-x>"] = fb_actions.move,
          ["<C-r>"] = fb_actions.rename,
          ["<C-d>"] = fb_actions.remove,
          ["<C-n>"] = fb_actions.create,
          ["h"] = fb_actions.goto_parent_dir,
          ["/"] = function()
            vim.cmd('startinsert')
          end
        },
      },
    },
  },
}

telescope.load_extension("file_browser")

vim.api.nvim_set_keymap(
  "n",
  "<space>b",
  ":Telescope file_browser<CR>",
  { noremap = true }
)

vim.keymap.set('n', '<C-p>',
  function()
    builtin.find_files({
      no_ignore = false,
      hidden = true
    })
  end)

vim.keymap.set('n', '<leader>f', function()
  builtin.live_grep()
end)

vim.keymap.set('n', 'fe', function()
  builtin.diagnostics()
end)
