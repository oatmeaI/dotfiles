require("hs.ipc")

-- StackLine (disabled, because it seems to have a bug that completely locked my computer the other day)
-- stackline = require "stackline"
-- stackline:init()
-- stackline.config:set('appearance.showIcons', false)
-- stackline.config:set('appearance.offset.x', 12)

-- Expose
exposeOtherBg = { red = 0.41, green = 0.41, blue = 0.41, alpha = 0.9 }
exposeBg = { red = 0.1, green = 0.2, blue = 0.3, alpha = 0.9 }
expose_space = hs.expose.new(nil, {
	includeOtherSpaces = true,
	includeNonVisible = true,
	fitWindowsInBackground = true,
	highlightColor = borderColor,
	backgroundColor = exposeBg,
	nonVisibleStripBackgroundColor = exposeOtherBg,
	otherSpacesStripBackgroundColor = exposeOtherBg,
	fontName = "FiraCode Nerd Font Mono",
	minimizeModeModifier = "ctrl",
})
-- hs.hotkey.bind("alt", "tab", "Expose", function()
-- 	expose_space:toggleShow()
-- end)
hs.hotkey.alertDuration = 0

-- Reload Hotkey
hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "R", function()
	hs.reload()
end)
hs.alert.show("Config loaded", {
	atScreenEdge = 0,
	padding = 10,
	fillColor = { red = 0.10, green = 0.11, blue = 0.18, alpha = 0.95 },
	strokeColor = { red = 0.10, green = 0.11, blue = 0.18, alpha = 0.95 },
	textFont = "FiraCodeNerdFontCompleteM-Retina",
	textSize = 14,
	textStyle = { paragraphStyle = { alignment = "center" } },
})

-- WindowBorders
borders = hs.loadSpoon("WindowBorders")
rules = {
	["Microsoft Outlook"] = { rejectTitles = { "Reminder" } },
	["Microsoft Teams"] = false,
	["Contexts"] = false,
}
borders:configure({ rules = rules, spacing = 5 })
borders:start()

helperFormat = {
	atScreenEdge = 0,
	padding = 10,
	fillColor = { red = 0.10, green = 0.11, blue = 0.18, alpha = 0.95 },
	strokeColor = { red = 0.10, green = 0.11, blue = 0.18, alpha = 0.95 },
	textFont = "FiraCodeNerdFontCompleteM-Retina",
	textSize = 14,
	textStyle = { paragraphStyle = { alignment = "center" } },
}

keyHints = {
	window_move = {
		{ mode = "", key = "q", action = "stack layout" },
		{ mode = "", key = "w", action = "bsp layout" },
		{ mode = "", key = "e", action = "float layout" },
		{ mode = "", key = "", action = "\n\n" },
		{ mode = "float", key = "space", action = "fullscreen" },
		{ mode = "", key = "", action = "\n\n" },
		{ mode = "bsp", key = "a", action = "resize left" },
		{ mode = "bsp", key = "f", action = "resize right" },
		{ mode = "bsp", key = "d", action = "toggle split" },
		{ mode = "bsp", key = "", action = "\n\n" },
		{ mode = "bsp", key = "ctrl + h,j,k,l", action = "focus" },
		{ mode = "bsp", key = "h,j,k,l", action = "warp" },
		{ mode = "bsp", key = "alt + h,j,k,l", action = "stack" },
		{ mode = "float", key = "1, 2", action = "half screen" },
		{ mode = "float", key = "3, 4, 5", action = "third screen" },
		{ mode = "float", key = "", action = "\n\n" },
		{ mode = "float", key = "left, right", action = "resize from right edge" },
		{ mode = "float", key = "alt + left, right", action = "resize from left edge" },
	},
}

skhd_help = {
	show = function(mode)
		string = ""
		print(borders.bspActive)
		for _, mapping in ipairs(keyHints[mode]) do
			if mapping.mode == "bsp" and borders.bspActive ~= true then
				goto continue
			end
			if mapping.mode == "float" and borders.bspActive == true then
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

-- Focus the last used window.
local function focusLastFocused()
	local wf = hs.window.filter
	local lastFocused = wf.defaultCurrentSpace:getWindows(wf.sortByFocusedLast)
	if #lastFocused > 0 then
		lastFocused[1]:focus()
	end
end

yabaiPath = "/usr/local/bin/yabai" --string.gsub(hs.execute("which yabai", true), "^%s*(.-)%s*$", "%1")

-- Create the chooser.
-- On selection, copy the emoji and type it into the focused application.
local chooser = hs.chooser.new(function(choice)
	if not choice then
		focusLastFocused()
		return
	end
	hs.execute(yabaiPath .. " -m window --focus " .. choice.id)
end)
local TITLE_MATCH_WEIGHT = 5
local matchCache = {}
local rankCache = {}
local function getRank(queries, choice)
	local rank = 0
	local choiceText = choice.text:lower()

	for _, q in ipairs(queries) do
		local qq = q:lower()
		local cacheKey = qq .. "|" .. choiceText

		if rankCache[cacheKey] == nil then
			local _, count1 = string.gsub(choiceText, qq, qq)
			local _, count2 = string.gsub(choice.subText, qq, qq)
			-- title match is much more likely to be relevant
			rankCache[cacheKey] = count2 * TITLE_MATCH_WEIGHT + count1
		end

		-- If any single query term doesn't match then we don't match at all
		if rankCache[cacheKey] == 0 then
			return 0
		end

		rank = rank + rankCache[cacheKey]
	end

	return rank
end

local function choiceSort(a, b)
	if a.rank == b.rank then
		return a.text < b.text
	end
	return a.rank > b.rank
end
function strSplit(str, pat)
	local t = {} -- NOTE: use {n = 0} in Lua-5.0
	local fpat = "(.-)" .. pat
	local lastEnd = 1
	local s, e, cap = str:find(fpat, 1)
	while s do
		if s ~= 1 or cap ~= "" then
			table.insert(t, cap)
		end
		lastEnd = e + 1
		s, e, cap = str:find(fpat, lastEnd)
	end
	if lastEnd <= #str then
		cap = str:sub(lastEnd)
		table.insert(t, cap)
	end
	return t
end
local function get_inserted_text(old, new)
	local prv = {}
	for o = 0, #old do
		prv[o] = ""
	end
	for n = 1, #new do
		local nxt = { [0] = new:sub(1, n) }
		local nn = new:sub(n, n)
		for o = 1, #old do
			local result
			if nn == old:sub(o, o) then
				result = prv[o - 1]
			else
				result = prv[o] .. nn
				if #nxt[o - 1] <= #result then
					result = nxt[o - 1]
				end
			end
			nxt[o] = result
		end
		prv = nxt
	end
	return prv[#old]
end

--chooser:bgDark(true)
windowSwitcher = function(choices)
	parsed = hs.json.decode(choices)
	chooser:query("")
	local cachedQuery = ""
	chooser:queryChangedCallback(function()
		local query = chooser:query()
		local added = get_inserted_text(cachedQuery, query)
		if added == "j" then
			chooser:query(cachedQuery)
			chooser:selectedRow(chooser:selectedRow() + 1)
			return
		end
		if added == "k" then
			chooser:query(cachedQuery)
			chooser:selectedRow(chooser:selectedRow() - 1)
			return
		end
		if query == "" then
			chooser:choices(parsed)
		else
			local choices = {}

			if matchCache[query] == nil then
				local queries = strSplit(query, " ")

				for _, aChoice in ipairs(parsed) do
					aChoice.rank = getRank(queries, aChoice)
					if aChoice.rank > 0 then
						choices[#choices + 1] = aChoice
					end
				end

				table.sort(choices, choiceSort)
				matchCache[query] = choices
			end

			chooser:choices(matchCache[query])
			cachedQuery = query
		end
	end)
	chooser:choices(parsed)
	chooser:show()
end
