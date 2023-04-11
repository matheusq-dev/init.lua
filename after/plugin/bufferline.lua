local status, bufferline = pcall(require, "bufferline")
if (not status) then return end

-- Gruvbox bufferline setup
bufferline.setup({
   highlights = {
        buffer_selected = {
                fg = "#61ffca",
                bg = '#000000',
                bold = true,
                italic = false,
            },
   },
  options = {
    mode = "buffers",
    separator_style = "any",
    always_show_bufferline = true,
    show_buffer_close_icons = false,
    show_close_icon = false,
    color_icons = true,
   view = "multiwindow",

  custom_filter = function(buf_number)
  -- since I use tabpages as per project (usually), I filter the buffers that don't belong to the current tabpage
  -- in combination with a root/project/cwd-plugin that autosets my cwd on selection of telescope:project,
  -- which I do on creation of a new tabpage, this works fine for me
  if not not vim.api.nvim_buf_get_name(buf_number):find(vim.fn.getcwd(), 0, true) then
    return true
  end
end,
  },
})

-- Neosolarized bufferline setup
-- bufferline.setup({
--   options = {
--     mode = "tabs",
--     separator_style = 'slant',
--     always_show_bufferline = false,
--     show_buffer_close_icons = false,
--     show_close_icon = false,
--     color_icons = true
--   },
--   highlights = {
--     separator = {
--       fg = '#073642',
--       bg = '#002b36',
--     },
--     separator_selected = {
--       fg = '#073642',
--     },
--     background = {
--       fg = '#657b83',
--       bg = '#002b36'
--     },
--     buffer_selected = {
--       fg = '#fdf6e3',
--     },
--     fill = {
--       bg = '#073642',
--       underline = true, undercurl = true, italic = true
--     }
--   },
-- })

vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', {})
vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', {})

vim.keymap.set('n', '<C-w>', '<Cmd>:bdelete<CR>', {})
vim.keymap.set('i', '<C-w>', '<Cmd>:bdelete<CR>', {})
