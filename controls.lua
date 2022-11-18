controls = {}



function controls.listen()
    width = love.graphics.getWidth()
    height = love.graphics.getHeight()
    
    --hero movement
    if love.keyboard.isDown("w") then
        -- if not Hero:has("animation") then
        --     Hero:give("animation", 0.75, {40, 41, 46, 43, 44, 47})
        --         :give("velocity", 0, -75)
        -- end
        Hero:give("velocity", 0, -75)
    elseif love.keyboard.isDown("s") then
        -- if not Hero:has("animation") then
        --     Hero:give("animation", 0.75, {32, 33, 38, 35, 36, 39})
        --         :give("velocity", 0, 75)
        -- end
        Hero:give("velocity", 0, 75)
    end
    if love.keyboard.isDown("a") then
        -- if not Hero:has("animation") then
        --     Hero:give("animation", 0.75, {56, 57, 62, 59, 60, 63})
        --         :give("velocity", -75, 0)
        -- end
        Hero:give("velocity", -75, 0)
    elseif love.keyboard.isDown("d") then
        -- if not Hero:has("animation") then
        --     Hero:give("animation", 0.75, {48, 49, 54, 51, 52, 55})
        --         :give("velocity", 75, 0)
        -- end
        Hero:give("velocity", 75, 0)
    end

    if not love.keyboard.isDown("s") and not love.keyboard.isDown("d") and not love.keyboard.isDown("w") and not love.keyboard.isDown("a") then
        if Hero:has("animation") then
            Hero:remove("animation")
                :remove("velocity")
        end

        Hero:remove("velocity")
    end

    --controls of the window
    if (love.keyboard.isDown("escape")) then
        love.event.quit()
    end

    if (love.keyboard.isDown("1")) then
        love.window.setFullscreen(false, "desktop")
    end

    if (love.keyboard.isDown("2")) then
        love.window.setFullscreen(true, "desktop")
    end

end

return controls