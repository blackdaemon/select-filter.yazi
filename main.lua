--- Filter with a smart-filter style prompt; on Enter, replace the selection
--- with the matches and return to the full list. Esc just cancels the filter.

local function entry()
	local input = ya.input {
		title = "Select by filter:",
		pos = { "top-center", y = 2, w = 50 },
		realtime = true,
		debounce = 0.1,
	}

	while true do
		local value, event = input:recv()
		if event ~= 1 and event ~= 3 then
			ya.emit("escape", { filter = true })
			return
		end

		if value == "" then
			if event == 1 then
				ya.emit("escape", { filter = true })
				return
			end
		else
			ya.emit("filter_do", { value, smart = true })
			if event == 1 then
				ya.emit("escape", { select = true })
				ya.emit("toggle_all", { state = "on" })
				ya.emit("escape", { filter = true })
				return
			end
		end
	end
end

return { entry = entry }
