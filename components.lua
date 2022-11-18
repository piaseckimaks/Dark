function InitializeComponents()
    Concord.component("info", function (component, name)
        component.name = name
        component.colided = false
        component.initialized = false
    end)

    Concord.component("quads", function(component, spriteSheet, height, width) 
        component.q = {}
        component.ss = love.graphics.newImage(spriteSheet)
        component.current = 0

        local index = 0
        for i = 0, component.ss:getHeight() - height, height do
            for j = 0, component.ss:getWidth() - width, width do
                local quad = love.graphics.newQuad(j, i, height, width, component.ss:getDimensions())
                table.insert(component.q, index, quad)
                index = index + 1
            end
        end

    end)
    
    Concord.component("position", function (component, x, y)
        component.x = x or 0
        component.y = y or 0
    end)
    
    Concord.component("velocity", function (component, x, y)
        component.x = x or 0
        component.y = y or 0
    end)
    
    Concord.component("drawable")

    Concord.component("collisionable")

    -- Concord.component("info", function (component, name)
    --     component.info.name = name
    -- end)
    
    Concord.component("animation", function (component, duration, sequence)
        component.duration = duration or 1
        component.sequence = sequence
        component.currentTime = 0
    end)
end