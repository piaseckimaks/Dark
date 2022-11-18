utils = {}

function load_assets()

end

function utils.create_quads(sprite_image, items_x, items_y, width, height)
    local quads = {}

    local index = 0
    for i = 0,7 do
        for j = 0,7 do
            quads[index] = love.graphics.newQuad(0, 64 * i, 64 * j, 64, sprite_image)
            index = index + 1
        end
    end
    
    --fb = face to bottom, ft = face to top, fl = face to left, fr = face to right
    -- standing_fb = love.graphics.newQuad(0, 64 * 0, 64, 64, human_sprite)
    -- standing_ft = love.graphics.newQuad(0, 64 * 1, 64, 64, human_sprite)
    -- standing_fr = love.graphics.newQuad(0, 64 * 2, 64, 64, human_sprite)
    -- standing_fl = love.graphics.newQuad(0, 64 * 3, 64, 64, human_sprite)

    -- --
    -- walking_fb = love.graphics.newQuad(0, 64 * 4, 64, 64, human_sprite)
    -- walking_ft = love.graphics.newQuad(0, 64 * 5, 64, 64, human_sprite)
    -- walking_fr = love.graphics.newQuad(0, 64 * 6, 64, 64, human_sprite)
    -- walking_fl = love.graphics.newQuad(0, 64 * 7, 64, 64, human_sprite)


    -- standing_fb = love.graphics.newQuad(0, 64 * 0, 64, 64, human_sprite)
    -- standing_ft = love.graphics.newQuad(0, 64 * 1, 64, 64, human_sprite)
    -- standing_fr = love.graphics.newQuad(0, 64 * 2, 64, 64, human_sprite)
    -- standing_fl = love.graphics.newQuad(0, 64 * 3, 64, 64, human_sprite)

    -- --
    -- walking_fb = love.graphics.newQuad(0, 64 * 4, 64, 64, human_sprite)
    -- walking_ft = love.graphics.newQuad(0, 64 * 5, 64, 64, human_sprite)
    -- walking_fr = love.graphics.newQuad(0, 64 * 6, 64, 64, human_sprite)
    -- walking_fl = love.graphics.newQuad(0, 64 * 7, 64, 64, human_sprite)

    return quads
end
 