
local status, colors = pcall(require, "lsp-colors")
if (not status) then return end

colors.setup({
  Error = "#db4b4b",
  Warning = "#e0af68",
  Information = "#e0af68",
  Hint = "#e0af68"
})
