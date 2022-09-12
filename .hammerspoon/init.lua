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
hs.alert.show("Config loaded")

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
    strokeColor = { white = 0, alpha = 2 },
    textFont = 'FiraCodeNerdFontCompleteM-Retina',
    textSize=14
}

keyHints = {
    window_move = "h,j,k,l -> warp      alt+h,j,k,l -> stack      a -> shrink      f -> grow      d -> toggle split      space -> float      q -> unfloat"
}
previousHelperID = ""
skhd_help = {
        show = function (mode)
            previousHelperID = hs.alert.show(keyHints[mode], helperFormat, true)
        end,
        hide = function ()
            hs.alert.closeSpecific(previousHelperID)
        end,
    }
