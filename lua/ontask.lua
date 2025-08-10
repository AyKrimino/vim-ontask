local M = {}

M.total_seconds = 1324521512

local get_time = function (seconds)
	local hours = seconds / 3600
	seconds = seconds % 3600
	local minutes = seconds / 60
	seconds = seconds % 60
	return hours, minutes, seconds
end

M.get_text = function()
	local hours, minutes, seconds = get_time(M.total_seconds)
  return string.format("Task: %d:%d:%d", hours, minutes, seconds)
end

M.setup = function()
  vim.opt.statusline = "%<%f %h%m%r%=%{v:lua.require('ontask').get_text()} %y"
end

M.start_tracking = function()
  M.setup()
end

return M
