events = {
    hs.window.filter.windowNotInCurrentSpace,
    hs.window.filter.windowInCurrentSpace,
    hs.window.filter.windowUnhidden,
    hs.window.filter.windowHidden,
    hs.window.filter.windowUnminimized,
    hs.window.filter.windowMinimized,
    hs.window.filter.windowDestroyed,
    hs.window.filter.windowCreated,
    hs.window.filter.windowMoved,
    hs.window.filter.windowFocused,
}

_G.borders = {}

function borders:configure(config)
    self.spacing = config.spacing and config.spacing or 5
    self.fadeSpeed = config.fadeSpeed and config.fadeSpeed or .25
    self.radius = borders.spacing + 8
    self.rules = config.rules and config.rules or {}
    self.borderColor = config.borderColor and config.borderColor or { red = 0.0, green = 0.53, blue = 0.74, alpha = 1 }
    self.inactiveBorderColor = config.inactiveBorderColor and config.inactiveBorderColor or { red = 0.41, green = 0.41, blue = 0.41, alpha = 0.7 }
end

function borders:renderBorder(canvas, focused)
    canvas:replaceElements({
        type = "rectangle",
        action = "stroke",
        strokeColor = focused and self.borderColor or self.inactiveBorderColor,
        strokeWidth = 4,
        roundedRectRadii = { xRadius = self.radius, yRadius = self.radius },
        padding = 2
    })
    canvas:level(focused and 2 or -1)
    canvas:show(self.fadeSpeed)
end

-- Returns a new frame that surrounds the given frame based on the spacing config
function borders:getBorderFrame(f)
    return { x = f.x - self.spacing, y = f.y - self.spacing, w = f.w + (self.spacing * 2), h = f.h + (self.spacing * 2) }
end

function borders:updateWindow(window, isFocused)
    id = window:id()
    frame = window:frame()

    self.canvases[id] = hs.canvas.new({})
    canvas = self.canvases[id]
    canvas:behavior('transient')
    canvas:frame(self:getBorderFrame(frame))

    self:renderBorder(canvas, isFocused)
end


function borders:updateWindows()
    newWindows = self.windowWatcher:getWindows(hs.window.filter.sortByFocusedLast)

    for _, canvas in pairs(self.canvases) do
        canvas:hide(self.fadeSpeed)
    end

    for _, window in ipairs(newWindows) do
        -- newWindows is ordered by most recently focused, so #1 is the currently focused window
        self:updateWindow(window, _ == 1)
    end
end

function borders:start()
    self.canvases = {}
    self.windowWatcher = hs.window.filter.new():setOverrideFilter({allowRoles = 'AXStandardWindow', visible = true, currentSpace = true})
    for app, rules in pairs(rules) do
        self.windowWatcher:setAppFilter(app, rules)
    end

    self.windowWatcher:subscribe(events, function() self:updateWindows() end, true)
    self.spaceWatcher = hs.spaces.watcher.new(function() self:updateWindows() end)
    self.spaceWatcher.start(self.spaceWatcher)

    -- These help reduce teh jank from the slow HS events
    -- Hammerspoon gets resize and move events a lot slower than Yabai does
    -- So as soon as Yabai gets an event, we fade the border out
    -- We fade the border back in when Hammerspoon gets the event - when the window is done being modified.
    -- This way, the border is hidden during the drag / resize, which keeps it from looking all laggy.
    yabaidirectcall = {
        window_resized = function (id)
            self.canvases[id]:hide(self.fadeSpeed)
        end,
        window_moved = function (id)
            self.canvases[id]:hide(self.fadeSpeed)
        end,
    }
end

return borders
