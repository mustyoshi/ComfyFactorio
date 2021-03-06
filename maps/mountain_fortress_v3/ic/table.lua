local Global = require 'utils.global'

local this = {}
Global.register(
    this,
    function(tbl)
        this = tbl
    end
)

local Public = {}

function Public.reset()
    if this.surfaces then
        for k, surface in pairs(this.surfaces) do
            if surface and surface.valid then
                game.delete_surface(surface)
            end
        end
    end
    for k, _ in pairs(this) do
        this[k] = nil
    end
    this.doors = {}
    this.cars = {}
    this.players = {}
    this.surfaces = {}
    this.entity_type = {
        ['car'] = true,
        ['tank'] = true
    }

    this.car_areas = {
        ['car'] = {left_top = {x = -20, y = 0}, right_bottom = {x = 20, y = 20}},
        ['tank'] = {left_top = {x = -20, y = 0}, right_bottom = {x = 20, y = 20}}
    }
end

function Public.get(key)
    if key then
        return this[key]
    else
        return this
    end
end

function Public.set_car_area(tbl)
    if not tbl then
        return
    end

    this.car_areas = tbl
end

return Public
