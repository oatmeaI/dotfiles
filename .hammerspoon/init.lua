require("hs.ipc")

canvases = {}
spacing = 5
radius = spacing + 8
borderColor = { red = 0.0, green = 0.53, blue = 0.74, alpha = 1 }
inactiveBorderColor = { red = 0.41, green = 0.41, blue = 0.41, alpha = 0.7 }
fadeSpeed = .25

windowWatcher = hs.window.filter.defaultCurrentSpace

function renderBorder(canvas, focused)
    canvas:replaceElements({
        type = "rectangle",
        action = "stroke",
        strokeColor = focused and borderColor or inactiveBorderColor,
        strokeWidth = 4,
        roundedRectRadii = { xRadius = radius, yRadius = radius },
        padding = 2
    })
    canvas:level(focused and 2 or 0)
    canvas:orderBelow()
    canvas:show(fadeSpeed)
end

function getBorderFrame(f)
    -- Make a frame that surrounds the given frame
    return { x = f.x - spacing, y = f.y - spacing, w = f.w + (spacing * 2), h = f.h + (spacing * 2) }
end

function updateWindow(window, isFocused)
    id = window:id()
    frame = window:frame()

    -- Create a new canvas, cache it, set the dimensions, and go render a border
    canvases[id] = hs.canvas.new({})
    canvas = canvases[id]
    canvas:behavior('transient')
    canvas:frame(getBorderFrame(frame))
    renderBorder(canvas, isFocused)
end

function updateWindows()
    newWindows = windowWatcher:getWindows(hs.window.filter.sortByFocusedLast)

    for _, canvas in pairs(canvases) do
        canvas:hide(fadeSpeed)
    end

    for _, window in ipairs(newWindows) do
        -- newWindows is ordered by most recently focused, so #1 is the currently focused window
        updateWindow(window, _ == 1)
    end
end

windowWatcher:subscribe(hs.window.filter.windowFocused, updateWindows, true)
windowWatcher:subscribe(hs.window.filter.windowMoved, updateWindows, true)
windowWatcher:subscribe(hs.window.filter.windowCreated, updateWindows, true)
windowWatcher:subscribe(hs.window.filter.windowDestroyed, updateWindows, true)

spaceWatcher = hs.spaces.watcher.new(updateWindows)
spaceWatcher.start(spaceWatcher)

-- These help reduce teh jank from the slow HS events
-- Hammerspoon gets resize and move events a lot slower than Yabai does
-- So as soon as Yabai gets an event, we fade the border out
-- We fade the border back in when Hammerspoon gets the event - when the window is done being modified.
-- This way, the border is hidden during the drag / resize, which keeps it from looking all laggy.
yabaidirectcall = {
    window_resized = function (id)
        canvases[id]:hide(fadeSpeed)
    end,
    window_moved = function (id)
        canvases[id]:hide(fadeSpeed)
    end,
}

