-- controls = require("controls")
-- Human = require("human")
-- assets = require("assets")
-- assets_dir = "assets"

-- function love.load()
--     assets.load(assets_dir)
--     love.window.setFullscreen(true, "desktop")

-- end

-- function love.update()
    
--     controls.listen()
--     FPS = love.timer.getFPS()
-- end

-- function love.draw()
--     --love.graphics.draw(human, 100, 100)
--     Human.draw()
    

--     --love.graphics.circle("fill", x, y, 50, 50)
--     love.graphics.print("Width: " .. love.graphics.getWidth() .. ", Height: " .. love.graphics.getHeight(), 10, 10, 0, 1, 1, 0, 0)
--     love.graphics.print("Width: " .. FPS, 10, 30, 0, 1, 1, 0, 0)

--     love.graphics.print("List of assets:", 10, 100, 0, 1, 1, 0, 0)


-- end

Concord = require("concord")
Vector = require("vector")
Controls = require("controls")
require("components")
require("systems")
require("entity")

function love.load()
    InitializeComponents()

    


    -- Create the World
    World = Concord.world()
    InitializeSystems()
    InitializeEntities()

    -- Add the Systems
    World:addSystems(MoveSystem, DrawSystem, AnimationSystem, PhysicsSystem)


    World:emit("init")
    love.window.setMode(800, 640)
end
-- Emit the events
function love.update(dt)
    Controls.listen()
    World:emit("update", dt)
    
end



function love.draw(dt)
    
    World:emit("draw", dt)
    
end