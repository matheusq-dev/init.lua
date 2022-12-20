local Toggleterm = require("toggleterm")
local Terminal = require("toggleterm.terminal").Terminal


local floatTerm =
Terminal:new(
    {
        hidden = true,
        direction = "float",
        float_opts = {
            border = "curved"
        },
    }
)

Toggleterm.float_toggle = function()
    floatTerm:toggle()
end
