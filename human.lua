Human = {}

Human.down = 0
Human.up = 1
Human.right = 2
Human.left = 3

human_sprite = love.graphics.newImage("assets/base/human.png")

Human["current_sprite"] = nil
Human["pos_x"] = nil
Human["pox_y"] = nil

--fb = face to bottom, ft = face to top, fl = face to left, fr = face to right
standing_fb = love.graphics.newQuad(0, 0, 64, 64, human_sprite)
standing_ft = love.graphics.newQuad(0, 64 * 1, 64, 64, human_sprite)
standing_fr = love.graphics.newQuad(0, 64 * 2, 64, 64, human_sprite)
standing_fl = love.graphics.newQuad(0, 64 * 3, 64, 64, human_sprite)

--
walking_fb = love.graphics.newQuad(0, 64 * 4, 64, 64, human_sprite)
walking_ft = love.graphics.newQuad(0, 64 * 5, 64, 64, human_sprite)
walking_fr = love.graphics.newQuad(0, 64 * 6, 64, 64, human_sprite)
walking_fl = love.graphics.newQuad(0, 64 * 7, 64, 64, human_sprite)

function Human.draw()

    if Human.current_sprite == nil then
        Human.current_sprite = standing_fr
    end

    if Human.pos_x == nil then
        Human.pos_x = 200
    end

    if Human.pox_y == nil then
        Human.pos_y = 200
    end

    love.graphics.draw(human_sprite, Human["current_sprite"], Human["pos_x"] , Human["pos_y"], 0, 2, 2)
end

return Human