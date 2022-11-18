-- Map = 0
-- Hero = 1
-- Enemy = 2
-- local entity_1 = Concord.entity(world)
-- :give("position", 100, 100)
-- :give("velocity", 100, 0)
-- :give("drawable")
require("map")

function InitializeEntities()
    

    MapEntities()

    Hero = Concord.entity(World)
    :give("info", "Hero")
    :give("position", 0, 45)
    :give("velocity", 0, 0)
    :give("drawable")
    :give("collisionable")
    :give("quads", "assets/base/hero.png", 64, 64)
end

