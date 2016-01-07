hs.window.animationDuration = 0

function windowMovement(modifier, adjustFrameFn)
    hs.hotkey.bind({'cmd', 'shift', 'ctrl'}, modifier, function()
        local window = hs.window.focusedWindow()
        if window and not window:isFullScreen() then
            local windowFrame = window:frame()
            local screen = window:screen()
            local screenFrame = screen:frame()
            adjustFrameFn(windowFrame, screenFrame)
            window:setFrame(windowFrame)
        end
    end)
end

windowMovement('h', function(windowFrame, screenFrame)
    windowFrame.x = screenFrame.x
    windowFrame.w = screenFrame.w / 2
end)

windowMovement('j', function(windowFrame, screenFrame)
    windowFrame.y = screenFrame.h / 2
    windowFrame.h = screenFrame.h / 2
end)

windowMovement('k', function(windowFrame, screenFrame)
    windowFrame.y = screenFrame.y
    windowFrame.h = screenFrame.h / 2
end)

windowMovement('l', function(windowFrame, screenFrame)
    windowFrame.x = screenFrame.w / 2
    windowFrame.w = screenFrame.w / 2
end)

windowMovement('Space', function(windowFrame, screenFrame)
    windowFrame.x = screenFrame.x
    windowFrame.y = screenFrame.y
    windowFrame.w = screenFrame.w
    windowFrame.h = screenFrame.h
end)

windowMovement('Tab', function(windowFrame, screenFrame)
    windowFrame.x = screenFrame.w / 2 - windowFrame.w / 2
    windowFrame.y = screenFrame.h / 2 - windowFrame.h / 2
end)

function reloadConfiguration(files)
    for _,file in pairs(files) do
        if file:sub(-4) == ".lua" then
            hs.alert.show("Reloading Hammerspoon...")
            hs.reload()
            return
        end
    end
end

hs.pathwatcher.new(
    os.getenv("HOME") .. "/.dotfiles/tag-osx/hammerspoon/",
    reloadConfiguration
):start()
