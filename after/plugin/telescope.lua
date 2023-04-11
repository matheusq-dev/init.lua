local status, telescope = pcall(require, "telescope")
if (not status) then return end
local actions = require('telescope.actions')
local builtin = require("telescope.builtin")
local project_actions = require("telescope._extensions.project.actions")
local project_utils = require("telescope._extensions.project.utils")
local telescope_actions = require("telescope.actions")

builtin.symbols{ sources = {'emoji', 'kaomoji', 'gitmoji'} }

local function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

local fb_actions = require "telescope".extensions.file_browser.actions


telescope.setup {
   defaults = {
    file_ignore_patterns = { "node_modules", ".git/*", "dist", "*/*.min.js"},
    mappings = {
      i = {
        ["<C-j>"] = actions.cycle_history_next,
        ["<C-k>"] = actions.cycle_history_prev,
      },
      n = {
        ["q"] = actions.close
      },
    },
    vimgrep_arguments = {
      "rg",
      "-L",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
    },
    prompt_prefix = "   ",
    selection_caret = "  ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        prompt_position = "bottom",
        preview_width = 0.55,
        results_width = 0.8,
      },
      vertical = {
        mirror = false,
      },
      width = 0.87,
      height = 0.80,
      preview_cutoff = 120,
    },
    file_sorter = require("telescope.sorters").get_fuzzy_file,
    generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
    path_display = { "truncate" },
    winblend = 0,
    border = {},
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    color_devicons = true,
    set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
  },
  extensions = {
    project = {
      base_dirs = {
        'C:/Users/matheusq/Documents/workspace',
      },
      hidden_files = true, -- default: false
      theme = "dropdown",
      order_by = "asc",
      search_by = "title",
      -- default for on_project_selected = find project files
      on_project_selected = function(prompt_bufnr)
        local path = project_actions.get_selected_path(prompt_bufnr)
        telescope_actions.close(prompt_bufnr)
        project_utils.change_project_dir(path)

        builtin.find_files({
          no_ignore = false,
          hidden = true
        })
      end
    },
    file_browser = {
      initial_mode = "normal",
      theme = "dropdown",
      respect_gitignore = true,
      hidden = true,
      grouped = true,
      previewer = false,
      layout_config = { 
        height = 25,
        horizontal = {
          prompt_position = "bottom"
        },
      },
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
telescope.load_extension("project")

vim.api.nvim_set_keymap(
  "n",
  "<space>b",
  ":Telescope file_browser path=%:p:h select_buffer=true <CR>",
  { noremap = true }
)


vim.api.nvim_set_keymap(
  "n",
  "<space>w",
  ":Telescope project <CR>",
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

vim.keymap.set('n', '<leader>d', function()
  builtin.diagnostics()
end)

