require("hs.ipc")

-- StackLine (disabled, because it seems to have a bug that completely locked my computer the other day)
-- stackline = require "stackline"
-- stackline:init()
-- stackline.config:set('appearance.showIcons', false)
-- stackline.config:set('appearance.offset.x', 12)

-- Expose
exposeOtherBg = { red = 0.41, green = 0.41, blue = 0.41, alpha = 0.9 }
exposeBg = { red = 0.1, green = 0.2, blue = 0.3, alpha = 0.9 }
expose_space = hs.expose.new(nil, { includeOtherSpaces = true, includeNonVisible = true, fitWindowsInBackground = true, highlightColor = borderColor, backgroundColor = exposeBg, nonVisibleStripBackgroundColor = exposeOtherBg, otherSpacesStripBackgroundColor = exposeOtherBg, fontName = "FiraCode Nerd Font Mono", minimizeModeModifier = "ctrl"})
hs.hotkey.bind('alt', 'tab', 'Expose', function() expose_space:toggleShow() end)
hs.hotkey.alertDuration = 0

-- Reload Hotkey
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "R", function()
  hs.reload()
end)
hs.alert.show("Config loaded", {
    atScreenEdge = 0,
    padding = 10,
    fillColor = { red = 0.10, green = 0.11, blue = 0.18, alpha = 0.95 },
    strokeColor  = { red = 0.10, green = 0.11, blue = 0.18, alpha = 0.95 },
    textFont = 'FiraCodeNerdFontCompleteM-Retina',
    textSize = 14,
    textStyle = { paragraphStyle = { alignment = "center" } }
})

-- WindowBorders
borders = hs.loadSpoon('WindowBorders')
rules = {
    ["Microsoft Outlook"] = { rejectTitles = {'Reminder'} },
    ['Microsoft Teams'] = false,
    ['Contexts'] = false
}
borders:configure({ rules = rules, spacing = 5 })
borders:start()

helperFormat = {
    atScreenEdge = 1,
    padding = 10,
    fillColor = { red = 0.10, green = 0.11, blue = 0.18, alpha = 0.95 },
    strokeColor  = { red = 0.10, green = 0.11, blue = 0.18, alpha = 0.95 },
    textFont = 'FiraCodeNerdFontCompleteM-Retina',
    textSize = 14,
    textStyle = { paragraphStyle = { alignment = "center" } }
}

keyHints = {
    window_move = {
        { key = "w", action = "float layout" },
        { key = "e", action = "bsp layout" },
        { key = "", action = "\n\n" },
        { key = "u,i,o,p", action = "focus" },
        { key = "a", action = "resize left" },
        { key = "d", action = "toggle split" },
        { key = "f", action = "resize right" },
        { key = "", action = "\n\n" },
        { key = "h,j,k,l", action = "warp" },
        { key = "alt + h,j,k,l", action = "stack" },
        { key = "", action = "\n\n" },
        { key = "q", action = "unfloat window" },
        { key = "space", action = "float window" },
    }
}

skhd_help = {
        show = function (mode)
            string = ''
            for _,mapping in ipairs(keyHints[mode]) do
                if string.len(mapping.key) > 0 then
                    string = string..mapping.key.." -> "..mapping.action..'      '
                else
                    string = string..mapping.action
                end
            end
            alertId = hs.alert.show(string, helperFormat, true)
        end,
        hide = function ()
            hs.alert.closeSpecific(alertId)
        end,
    }
