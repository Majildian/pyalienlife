local collision_mask_util = require '__core__/lualib/collision-mask-util'

_G.vessel_collision_mask = collision_mask_util.get_first_unused_layer()

RECIPE {
    type = 'recipe',
    name = 'vessel',
    energy_required = 20,
    enabled = false,
    category = 'creature-chamber',
    ingredients = {
        {'earth-generic-sample', 1},
        {'microcin-j25', 1},
        {'alien-sample01', 2},
        {type = 'fluid', name = 'water-saline', amount = 20},
        {type = 'fluid', name = 'coal-slurry', amount = 20},
    },
    results = {
        {'vessel', 40}
    }
}:add_unlock('biofluid-mk01')

RECIPE {
    type = 'recipe',
    name = 'vessel-to-ground',
    energy_required = 40,
    enabled = false,
    category = 'creature-chamber',
    ingredients = {
        {'vessel', 10},
        {'earth-generic-sample', 1},
        {'peptidase-m58', 1},
        {'alien-sample-02', 2},
        {'bio-sample', 3},
        {type = 'fluid', name = 'water-saline', amount = 40},
        {type = 'fluid', name = 'fetal-serum', amount = 10},
        {type = 'fluid', name = 'coal-slurry', amount = 40},
    },
    results = {
        {'vessel-to-ground', 10}
    }
}:add_unlock('biofluid-mk02')

ITEM {
    type = 'item',
    name = 'vessel',
    icon = '__pyalienlifegraphics2__/graphics/icons/vessel.png',
    icon_size = 64,
    flags = {},
    subgroup = 'py-alienlife-biofluid-network',
    order = 'da',
    place_result = 'vessel',
    stack_size = 100
}

ITEM {
    type = 'item',
    name = 'vessel-to-ground',
    icons = {{
        icon = '__pyindustry__/graphics/icons/niobium-pipe-to-ground.png',
        icon_size = 32,
        tint = {0.5, 0.5, 1}
    }},
    flags = {},
    subgroup = 'py-alienlife-biofluid-network',
    order = 'db',
    place_result = 'vessel-to-ground',
    stack_size = 100
}

local variants = {
    'straight-base-vertical',
    'straight-base-horizontal',
    'straight-base-vertical',
    'straight-horizontal',
    'curved-right-up',
    'curved-right-down',
    'curved-left-down',
    'curved-left-up',
    'junction-down',
    'junction-left',
    'junction-up',
    'junction-right',
    'full-junction',
}

local animations = {}
for _, variant in pairs(variants) do
    animations[#animations+1] = {
        layers = {
            {
                filename = '__pyalienlifegraphics2__/graphics/entity/vessel/vessel-'..variant..'.png',
                priority = 'high',
                width = 640/5/2,
                height = 768/6/2,
                frame_count = 5*6,
                line_length = 5,
                shift = {0, 0},
                scale = 0.335*2,
                animation_speed = 0.3,
                hr_version = {
                    filename = '__pyalienlifegraphics2__/graphics/entity/vessel/hr-vessel-'..variant..'.png',
                    priority = 'high',
                    width = 640/5,
                    height = 768/6,
                    frame_count = 5*6,
                    line_length = 5,
                    shift = {0, 0},
                    scale = 0.335,
                    animation_speed = 0.3
                }
            }
        }
    }
end

local gap = {
    filename = '__pyalienlifegraphics2__/graphics/entity/vessel/vessel-straight-vertical.png',
    priority = 'high',
    width = 640/5/2,
    height = 768/6/2,
    frame_count = 5*6,
    line_length = 5,
    shift = util.by_pixel(0, 8),
    scale = 0.335*2,
    animation_speed = 0.3,
    hr_version = {
        filename = '__pyalienlifegraphics2__/graphics/entity/vessel/hr-vessel-straight-vertical.png',
        priority = 'high',
        width = 640/5,
        height = 768/6,
        frame_count = 5*6,
        line_length = 5,
        shift = util.by_pixel(0, 8),
        scale = 0.335,
        animation_speed = 0.3
    }
}

local function fix_gap(index)
    animations[index].layers[2] = gap
end

fix_gap(3)
fix_gap(6)
fix_gap(7)
fix_gap(10)
fix_gap(11)
fix_gap(12)
fix_gap(13)

data:extend{{
    name = 'vessel',
    type = 'simple-entity-with-owner',
    icon = data.raw.item['vessel'].icon,
    icon_size = 64,
    flags = {'placeable-neutral', 'player-creation', 'not-rotatable'},
    minable = {mining_time = 0.2, result = 'vessel'},
    max_health = 100,
    corpse = 'small-remnants',
    collision_box = table.deepcopy(data.raw['pipe']['pipe'].collision_box),
    selection_box = table.deepcopy(data.raw['pipe']['pipe'].selection_box),
    collision_mask = {vessel_collision_mask},
    animations = animations,
    fast_replaceable_group = 'vessel',
    next_upgrade = nil,
    render_layer = 'lower-object-above-shadow',
    vehicle_impact_sound = {filename = '__base__/sound/car-metal-impact.ogg', volume = 0.65},
}}

local underground_pipe = table.deepcopy(data.raw['pipe-to-ground']['pipe-to-ground'])
underground_pipe.name = 'vessel-to-ground'
underground_pipe.minable = {mining_time = 0.2, result = 'vessel-to-ground'}
underground_pipe.fast_replaceable_group = 'vessel'
underground_pipe.next_upgrade = nil
underground_pipe.fluid_box = {
    base_area = 0.01,
    base_level = 1999,
    pipe_connections = {
        {
            position = {0, -1}
        },
        {
            position = {0, 1},
            max_underground_distance = 48
        }
    }
}
underground_pipe.collision_mask = {vessel_collision_mask}
data:extend{underground_pipe}

data:extend{{
    name = 'vessel-to-ground-heat-connection',
    type = 'furnace',
    bottleneck_ignore = true,
    icon = underground_pipe.icon or '__base__/graphics/icons/pipe-to-ground.png',
    icon_size = underground_pipe.icon_size or 64,
    localised_name = {'entity-name.vessel-to-ground'},
    localised_description = {'entity-description.vessel-to-ground'},
    flags = {'hidden', 'placeable-neutral', 'no-automated-item-insertion', 'no-automated-item-removal', 'not-flammable'},
    collision_box = underground_pipe.collision_box,
    collision_mask = {},
    show_recipe_icon = false,
    crafting_speed = 1,
    result_inventory_size = 0,
    source_inventory_size = 0,
    crafting_categories = {'biofluid'},
    energy_source = {
        connections = {
          {
            direction = 0,
            position = {0, 0}
          }
        },
        max_temperature = 0,
        default_temperature = 0,
        min_working_temperature = 0,
        max_transfer = '1W',
        specific_heat = '1W',
        type = 'heat',
        pipe_covers = require('__pyalienlife__/prototypes/biofluid/pipe-cover'),
        heat_pipe_covers = require('__pyalienlife__/prototypes/biofluid/pipe-cover'),
    },
    energy_usage = '1W',
    show_recipe_icon_on_map = false,
}}