require("hs.ipc")

--# canvas elements
local canvases = {
}

--# helpers
function yabai(args, completion)
  local yabai_output = ""
  local yabai_error = ""
  -- Runs in background very fast
  local yabai_task = hs.task.new("/usr/local/bin/yabai",nil, function(task, stdout, stderr)
    -- print("stdout:"..stdout, "stderr:"..stderr)
    if stdout ~= nil then yabai_output = yabai_output..stdout end
    if stderr ~= nil then yabai_error = yabai_error..stderr end
    return true
  end, args)
  if type(completion) == "function" then
    yabai_task:setCallback(function() completion(yabai_output, yabai_error) end)
  end
  yabai_task:start()
end

function drawBorders()
        -- want to hide all borders here somehow
    yabai({"-m", "query", "--windows"}, function (out, err)
        if out == nil or type(out) ~= "string" or string.len(out) == 0 then
            return
        else
        out = string.gsub(out, ":inf,", ":0.0,")
        local json = "{\"windows\":"..out.."}"
        local json_obj = hs.json.decode(json)
        if json_obj ~= nil then
          local windows = json_obj.windows
          for i, win in ipairs(windows) do
                    createBorder(win)
            end
          end
        end
      end
    )

end

function contains(table, element)
  for _, value in pairs(table) do
    if _ == element then
      return true
    end
  end
  return false
end

local stack = -1

function createBorder(win)
    if win['stack-index'] <= stack and win['stack-index'] ~= 0 then
        return
    end
    stack = win['stack-index']
    if win == nil or (win['app'] =='Hammerspoon' and win.title ~= 'Hammerspoon Console') then
        return
    end

    if contains(canvases,win.id) then
        canvases[win.id]:delete()
    end

    if win['is-visible'] == false then
        return
    end

    local spacing = 5
    local radius = spacing + 8
    local borderColor = { red = 0.0, green = 0.53, blue = 0.74, alpha = 1 }
    local inactiveBorderColor = { red = 0.41, green = 0.41, blue = 0.41, alpha = 0.7 }

    canvases[win.id] = hs.canvas.new({ x = win.frame.x, y = win.frame.y, w = win.frame.w, h = win.frame.h })
    canvases[win.id]:topLeft({ x = win.frame.x - spacing, y = win.frame.y - spacing })
    canvases[win.id]:size({ w = win.frame.w + (spacing * 2), h = win.frame.h + (spacing * 2) })

    canvases[win.id]:replaceElements({
        type = "rectangle",
        action = "stroke",
        strokeColor = win['has-focus'] and borderColor or inactiveBorderColor,
        strokeWidth = 4,
        roundedRectRadii = { xRadius = radius, yRadius = radius },
        padding = 2
    })

    canvases[win.id]:level(win.level + 1) -- Don't want the window shadow to affect it, but want to be under menus, notifications, etc.
    canvases[win.id]:show()

    if win['has-focus'] ~= true then
       canvases[win.id]:sendToBack() -- i couldnt figure out how to sort windows by stack-index, so this stops windows further down from rendering borders on top of ones higher up
    end
end

--# install cli
hs.ipc.cliInstall()

-- calls made by yabai frow cli, see .yabairc
-- should replace this all with one message from yabai
yabaidirectcall = {
  window_focused = function(window_id)
    drawBorders()
  end,
  application_activated = function(process_id)
    drawBorders()
  end,
  window_resized = function(window_id)
    drawBorders()
  end,
  window_moved = function(window_id)
    drawBorders()
  end
}

drawBorders()
