function UnitVector(x, y)
    local m = x*x + y*y
    local unitVec = {x = 0, y = 0}
    unitVec.x = x/m
    unitVec.y = y/m

    return unitVec
end

UnitVector(3,4)