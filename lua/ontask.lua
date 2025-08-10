local M = {}

M.total_seconds = 0

local update_timer = function ()
	M.total_seconds = M.total_seconds + 1
	vim.cmd("redrawstatus")
end

local get_time = function (seconds)
	local hours = seconds / 3600
	seconds = seconds % 3600
	local minutes = seconds / 60
	seconds = seconds % 60
	return hours, minutes, seconds
end

M.get_text = function()
	local hours, minutes, seconds = get_time(M.total_seconds)
  return string.format("Task: %02d:%02d:%02d", hours, minutes, seconds)
end

M.setup = function()
  vim.opt.statusline = "%<%f %h%m%r%=%{v:lua.require('ontask').get_text()} %y"
end

M.start_tracking = function()
	vim.fn.timer_start(1000, update_timer, {
		["repeat"] = -1,
	})

  M.setup()
end

return M
