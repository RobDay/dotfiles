local grid = require "mjolnir.bg.grid"
local hotkey = require "mjolnir.hotkey"
local window = require "mjolnir.window"
local alert = require "mjolnir.alert"


-- -- show a helpful menu
-- menu.show(function()
--     local updatetitles = {[true] = "Install Update", [false] = "Check for Update..."}
--     local updatefns = {[true] = updates.install, [false] = checkforupdates}
--     local hasupdate = (updates.newversion ~= nil)
--
--     return {
--         {title = "Reload Config", fn = mjolnir.reload},
--         {title = "-"},
--         {title = "About", fn = mjolnir.showabout},
--         {title = updatetitles[hasupdate], fn = updatefns[hasupdate]},
--         {title = "Quit mjolnir", fn = os.exit},
--     }
--     end)

    -- move the window to the right half of the screen
    function movewindow_righthalf()
        local win = window.focusedwindow()
        local newframe = win:screen():frame()
        newframe.w = newframe.w / 2
        newframe.x = newframe.x + newframe.w -- comment this line to push it to left half of screen
        win:setframe(newframe)
    end

    -- move the window to the right half of the screen
    function movewindow_lefthalf()
        local win = window.focusedwindow()
        local newframe = win:screen():frame()
        newframe.w = newframe.w / 2
        --  newframe.x = newframe.w -- comment this line to push it to left half of screen
        win:setframe(newframe)
    end


    local mash = {"alt", "ctrl"}
    local mashshift = {"alt", "shift"}

    hotkey.bind(mash, ';', function() grid.snap(window.focusedwindow()) end)
    hotkey.bind(mash, "'", function() fnutils.map(window.visiblewindows(), grid.snap) end)

    hotkey.bind(mash, '=', function() grid.adjustwidth( 1) end)
    hotkey.bind(mash, '-', function() grid.adjustwidth(-1) end)

    hotkey.bind(mashshift, 'H', function() window.focusedwindow():focuswindow_west() end)
    hotkey.bind(mashshift, 'L', function() window.focusedwindow():focuswindow_east() end)
    hotkey.bind(mashshift, 'K', function() window.focusedwindow():focuswindow_north() end)
    hotkey.bind(mashshift, 'J', function() window.focusedwindow():focuswindow_south() end)

    hotkey.bind(mash, 'M', grid.maximize_window)

    hotkey.bind(mash, 'N', grid.pushwindow_nextscreen)
    hotkey.bind(mash, 'P', grid.pushwindow_prevscreen)

    hotkey.bind(mash, 'J', grid.pushwindow_down)
    hotkey.bind(mash, 'K', grid.pushwindow_up)
    hotkey.bind(mash, 'H', grid.pushwindow_left)
    hotkey.bind(mash, 'L', grid.pushwindow_right)

    hotkey.bind(mash, 'Y', grid.resizewindow_shorter)
    hotkey.bind(mash, 'U', grid.resizewindow_taller)
    hotkey.bind(mash, 'O', grid.resizewindow_wider)
    hotkey.bind(mash, 'I', grid.resizewindow_thinner)

    -- hotkey.bind(mash, "R", repl.open)

    hotkey.new(mash, "Left", movewindow_lefthalf):enable()
    hotkey.new(mash, "Right", movewindow_righthalf):enable()
