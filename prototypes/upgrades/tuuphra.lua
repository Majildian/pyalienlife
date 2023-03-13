local FUN = require '__pycoalprocessing__/prototypes/functions/functions'

if data then
    local recipe = table.deepcopy(data.raw.recipe['tuuphra-seeds'])
    recipe.name = recipe.name .. '-with-water'
    FUN.add_ingredient(recipe, {type = 'fluid', name = 'water', amount = 1000})
    FUN.add_result_amount(recipe, 'tuuphra-seeds', 2)
    data:extend{recipe}

    data:extend{
        {
            type = 'item',
            name = 'fungicide',
            icon = '__pyalienlifegraphics__/graphics/icons/fungicide.png',
            icon_size = 64,
            stack_size = 50,
            subgroup = 'py-alienlife-genetics'
        },
        {
            type = 'recipe',
            name = 'fungicide',
            enabled = false,
            category = 'biofactory',
            ingredients = {
                {type = 'item', name = 'copper-plate', amount = 1},
                {type = 'item', name = 'plastic-bar', amount = 2},
                {type = 'item', name = 'sulfur', amount = 1},
                {type = 'fluid', name = 'phosphorous-acid', amount = 10},
            },
            results = {{'fungicide', 1}},
            energy_required = 10
        }
    }

    for i, recipe in pairs({
        table.deepcopy(data.raw.recipe['tuuphra-1']),
        table.deepcopy(data.raw.recipe['tuuphra-2']),
        table.deepcopy(data.raw.recipe['tuuphra-3']),
        table.deepcopy(data.raw.recipe['tuuphra-4']),
    }) do
        recipe.name = recipe.name .. '-fungicide'
        FUN.add_ingredient(recipe, {'fungicide', i})
        FUN.remove_ingredient(recipe, 'pesticide-mk01')
        FUN.remove_ingredient(recipe, 'pesticide-mk02')
        recipe.energy_required = math.ceil(recipe.energy_required * 0.85)
        data:extend{recipe}
    end

    data:extend{{
        type = 'recipe',
        name = 'tuuphra-grease',
        energy_required = 4,
        ingredients = {{'tuuphra', 1}},
        results = {
            {type = 'item', name = 'starch', amount = 1, probability = 0.2},
            {type = 'fluid', name = 'grease', amount = 8}
        },
        enabled = false,
        category = 'biofactory',
        main_product = 'grease'
    }}
end

return {
    affected_entities = { -- the entities that should be effected by this tech upgrade
        'tuuphra-plantation-mk01',
        'tuuphra-plantation-mk02',
        'tuuphra-plantation-mk03',
        'tuuphra-plantation-mk04',
    },
    master_tech = { -- tech that is shown in the tech tree
        name = 'tuuphra-upgrade',
        icon = '__pyalienlifegraphics3__/graphics/technology/updates/u-tuuphra.png',
        icon_size = 128,
        order = 'c-a',
        prerequisites = {'tuuphra-mk02'},
        unit = {
            count = 500,
            ingredients = {
                {'automation-science-pack', 1},
                {'logistic-science-pack', 1},
                {'py-science-pack-2', 1},
            },
            time = 45
        }
    },
    sub_techs = {
        {
            name = 'fi',
            icon = '__pyalienlifegraphics3__/graphics/technology/fi.png',
            icon_size = 128,
            order = 'c-a',
            effects = { -- the effects the tech will have on the building. valid types: 'module-effects', 'unlock-recipe', 'lock-recipe', 'recipe-replacement'
                {consumption = 0.5, type = 'module-effects'},
                {old = 'tuuphra-seeds', new = 'tuuphra-seeds-with-water', type = 'recipe-replacement'}
            },
        },
        {
            name = 'fungicide',
            icon = '__pyalienlifegraphics3__/graphics/technology/fungicide.png',
            icon_size = 128,
            order = 'c-a',
            effects = { -- the effects the tech will have on the building. valid types: 'module-effects', 'unlock-recipe', 'lock-recipe', 'recipe-replacement'
                {pollution = 2, type = 'module-effects'},
                {recipe = 'fungicide', type = 'unlock-recipe'},
                {old = 'tuuphra-1', new = 'tuuphra-1-fungicide', type = 'recipe-replacement'},
                {old = 'tuuphra-2', new = 'tuuphra-2-fungicide', type = 'recipe-replacement'},
                {old = 'tuuphra-3', new = 'tuuphra-3-fungicide', type = 'recipe-replacement'},
                {old = 'tuuphra-4', new = 'tuuphra-4-fungicide', type = 'recipe-replacement'},
            }
        },
        {
            name = 'tr',
            icon = '__pyalienlifegraphics3__/graphics/technology/tr.png',
            icon_size = 128,
            order = 'c-a',
            effects = { -- the effects the tech will have on the building. valid types: 'module-effects', 'unlock-recipe', 'lock-recipe', 'recipe-replacement'
                {recipe = 'tuuphra-grease', type = 'unlock-recipe'}
            }
        }
    },
    module_category = 'tuuphra'
}