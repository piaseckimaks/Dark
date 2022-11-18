local bump = require("bump")
local bump_debug = require 'bump_debug'

function InitializeSystems()
    PhysicWorld = bump.newWorld(32)

    -- Defining Systems
    MoveSystem = Concord.system({
        pool = {"position", "velocity", "info"}
    })

    function MoveSystem:update(dt)
        for _, e in ipairs(self.pool) do
            
            if e.velocity.x ~= 0 or e.velocity.y ~= 0 then
                local dx = e.velocity.x * dt
                local dy = e.velocity.y * dt
                local cols, len

                e.position.x , e.position.y, cols, len = PhysicWorld:move(e, e.position.x + dx, e.position.y + dy)

                if len > 0 then
                    e.info.colided = true
                else
                    e.info.colided = false
                end
            end
        end
    end


    DrawSystem = Concord.system({
        pool = {"position", "quads", "drawable", "info"}
    })

    function DrawSystem:draw()
        --bump_debug.draw(PhysicWorld)
        for _, e in ipairs(self.pool) do
            if e.info.name == "Hero" then
                love.graphics.draw(e.quads.ss, e.quads.q[e.quads.current], e.position.x, e.position.y, 0, 0.5, 0.5)
            else
                love.graphics.draw(e.quads.ss, e.quads.q[e.quads.current], e.position.x, e.position.y)
            end

            if e.info.name ~= "Hero" and e.info.initialized == true then
                love.graphics.rectangle("line",e.position.x, e.position.y, 32, 32)
            end
            if e.info.name == "Hero" and e.info.initialized == true then
                love.graphics.rectangle("line",e.position.x, e.position.y, 32, 32)
            end
            if e.info.name == "Hero" then
                love.graphics.print(e.position.x.." "..e.position.y, 5, 5)
                love.graphics.print("Colided "..tostring(e.info.colided), 200, 5)
                love.graphics.print("Initialized in physics: "..tostring(e.info.initialized), 400, 5)
            end

           
        end
        
    end

    AnimationSystem = Concord.system({
        pool = {"quads", "animation" }
    })

    function AnimationSystem:update(dt)
        for _, e in ipairs(self.pool) do
            e.animation.currentTime = e.animation.currentTime + dt
            if e.animation.currentTime >= e.animation.duration then
                e.animation.currentTime = e.animation.currentTime - e.animation.duration
            end
        end
    end

    function AnimationSystem:draw()
        for _, e in ipairs(self.pool) do
            e.quads.current = e.animation.sequence[math.floor(e.animation.currentTime / e.animation.duration * #e.animation.sequence) + 1]
        end
    end

    

    PhysicsSystem = Concord.system({
        pool = {"position", "collisionable", "velocity", "info"}
    })

    function PhysicsSystem:init()
        for _, e in ipairs(self.pool) do
            --PhysicWorld:add(e, e.position.x, e.position.y, 32, 32)
            if e.info.name == "Wall" then
                PhysicWorld:add(e, e.position.x, e.position.y, 32, 32)
            end

            if e.info.name == "Hero" then
                PhysicWorld:add(e,e.position.x, e.position.y, 32, 32)
            end
            e.info.initialized = true
        end
    end

    -- function PhysicsSystem:update(dt)
    --     for _, e in ipairs(self.pool) do

    --         if e.velocity.x ~= 0 or e.velocity.y ~= 0 then
    --         local actuaX, actualY, cols, len = PhysicWorld:move(e, e.position.x, e.position.y)
            
    --         e.info.colided = len
    --         end
    --     end
    -- end

end