function windowKey(modifier, frameAdjustment)
    hs.hotkey.bind({'cmd', 'shift', 'ctrl'}, modifier, function()
        local window = hs.window.focusedWindow()
        local frame = window:frame()
        local screen = window:screen()
        local max = screen:frame()
        frameAdjustment(frame, max)
        window:setFrame(frame)
    end)
end

windowKey('h', function(frame, max)
    frame.x = max.x
    frame.y = max.y
    frame.w = max.w / 2
    frame.h = max.h
end)

windowKey('j', function(frame, max)
    frame.x = max.x
    frame.y = max.y + (max.h / 2)
    frame.w = max.w
    frame.h = max.h / 2
end)

windowKey('k', function(frame, max)
    frame.x = max.x
    frame.y = max.y
    frame.w = max.w
    frame.h = max.h / 2
end)

windowKey('l', function(frame, max)
    frame.x = max.x + (max.w / 2)
    frame.y = max.y
    frame.w = max.w / 2
    frame.h = max.h
end)

windowKey('Space', function(frame, max)
    frame.x = max.x
    frame.y = max.y
    frame.w = max.w
    frame.h = max.h
end)

windowKey('Tab', function(frame, max)
    frame.x = (max.w / 2) - (frame.w / 2)
    frame.y = (max.h / 2) - (frame.h / 2)
end)

windowKey('s', function(frame, max)
    frame.w = 640
    frame.h = 480
    frame.x = (max.w / 2) - (frame.w / 2)
    frame.y = (max.h / 2) - (frame.h / 2)
end)

hs.window.animationDuration = 0

function reloadConfig(files)
    doReload = false
    for _,file in pairs(files) do
        if file:sub(-4) == ".lua" then
            doReload = true
        end
    end
    if doReload then
        hs.reload()
    end
end

hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
