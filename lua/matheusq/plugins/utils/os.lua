local M = {}

function M.is_windows()
	local sysname = vim.loop.os_uname().sysname
	return sysname == "Windows" or sysname == "Windows_NT"
end

return M
