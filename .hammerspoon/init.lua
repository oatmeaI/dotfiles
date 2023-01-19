require("hs.ipc")

stackline = require("stackline")
stackline:init(stacklineConfig)
stackline.config:set("appearance.offset.x", 8)
stackline.config:set("appearance.size", 24)
stackline.config:set("advanced.maxRefreshRate", 0.25)

hs.alert.show("Config loaded", {
	atScreenEdge = 0,
	padding = 10,
	fillColor = { red = 0.10, green = 0.11, blue = 0.18, alpha = 0.95 },
	strokeColor = { red = 0.10, green = 0.11, blue = 0.18, alpha = 0.95 },
	textFont = "FiraCodeNerdFontCompleteM-Retina",
	textSize = 14,
	textStyle = { paragraphStyle = { alignment = "center" } },
})

-- Reload Hotkey
hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "R", function()
	hs.reload()
end)

-- skhd Cheatsheet
bspActive = false
helperFormat = {
	atScreenEdge = 0,
	padding = 10,
	fillColor = { red = 0.10, green = 0.11, blue = 0.18, alpha = 0.95 },
	strokeColor = { red = 0.10, green = 0.11, blue = 0.18, alpha = 0.95 },
	textFont = "FiraCodeNerdFontCompleteM-Retina",
	textSize = 14,
	textStyle = { paragraphStyle = { alignment = "center" } },
}

-- hs.alert.show(
-- 	"alt + [h/j/k/l]: -> focus windows      alt + tab: -> cycle windows      shift + alt + [j/k]: -> cycle stacks",
-- 	{
-- 		atScreenEdge = 1,
-- 		padding = 6,
-- 		fillColor = { red = 0.10, green = 0.11, blue = 0.18, alpha = 0.95 },
-- 		strokeColor = { red = 0.10, green = 0.11, blue = 0.18, alpha = 0.95 },
-- 		textFont = "FiraCodeNerdFontCompleteM-Retina",
-- 		textSize = 14,
-- 		textStyle = { paragraphStyle = { alignment = "center" } },
-- 	},
-- 	true
-- )

keyHints = {
	window_move = {
		{ mode = "", key = "q", action = "stack layout" },
		{ mode = "", key = "w", action = "bsp layout" },
		{ mode = "", key = "e", action = "float layout" },
		{ mode = "", key = "", action = "\n\n" },
		{ mode = "float", key = "space", action = "fullscreen" },
		{ mode = "float", key = "", action = "\n\n" },
		{ mode = "bsp", key = "a", action = "resize left" },
		{ mode = "bsp", key = "f", action = "resize right" },
		{ mode = "bsp", key = "d", action = "toggle split" },
		{ mode = "bsp", key = "", action = "\n\n" },
		{ mode = "bsp", key = "h,j,k,l", action = "focus" },
		{ mode = "bsp", key = "ctrl + h,j,k,l", action = "warp" },
		{ mode = "bsp", key = "alt + h,j,k,l", action = "stack" },
		{ mode = "float", key = "1, 2", action = "half screen" },
		{ mode = "float", key = "3, 4, 5", action = "third screen" },
		{ mode = "float", key = "", action = "\n\n" },
		{ mode = "float", key = "left, right", action = "resize from right edge" },
		{ mode = "float", key = "alt + left, right", action = "resize from left edge" },
		{ mode = "", key = "", action = "\n\n" },
		{ mode = "", key = "shift + alt + [num]", action = "move window to space [num]" },
	},
}

skhd_help = {
	setBspActive = function(active)
		bspActive = active == 1 and true or false
	end,
	show = function(mode)
		string = ""
		for _, mapping in ipairs(keyHints[mode]) do
			if mapping.mode == "bsp" and bspActive ~= true then
				goto continue
			end
			if mapping.mode == "float" and bspActive == true then
				goto continue
			end
			if string.len(mapping.key) > 0 then
				string = string .. mapping.key .. " -> " .. mapping.action .. "      "
			else
				string = string .. mapping.action
			end
			::continue::
		end
		alertId = hs.alert.show(string, helperFormat, true)
	end,
	hide = function()
		hs.alert.closeSpecific(alertId)
	end,
}
