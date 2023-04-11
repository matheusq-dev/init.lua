local status, autotag = pcall(require, "nvim-ts-autotag")
if (not status) then return end

autotag.setup({})

local status2, emmet = pcall(require, "mattn/emmet-vim")
if (not status2) then return end

emmet.setup({})
