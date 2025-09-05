if mods.pyalternativeenergy then -- used in turd upgrade zipir path 3
    local recipe = RECIPE("zipir1-pyvoid"):copy()
    recipe.name = "zipir1-pyvoid-hatchery"
    recipe.icons = nil
    recipe.icon = "__pyhightechgraphics__/graphics/icons/rendering.png"
    recipe.icon_size = 32
    recipe.results = {{type = "item", name = "processed-ash", probability = 0.8, amount = 1}}
    data:extend {recipe}
end

--ADAPTATIONS

for _, drill in pairs(data.raw["mining-drill"]) do
    if drill.allowed_effects then
        --Do not adjust drills that already have had their allowed effects set
    elseif drill.module_slots and drill.module_slots ~= 0 then
        drill.allowed_effects = {"consumption", "speed", "productivity"}
    else
        drill.allowed_effects = {"consumption", "productivity"}
    end
end

local recipes_list = {
    "biomass-1-a",
    "biomass-1",
    "biomass-2",
    "fish-oil",
    "manure-to-biomass",
    "neuromorphic-chip",
    "organics-from-wood-2",
    -- Above recipes do not exist, probably safe to remove these lines
    "fertilizer-2",
    "biofilm-pyht",
    "deposited-core",
    "graphene-roll",
    "processor-core",
    "high-flux-core",
    "diode-core",
    "carbon-nanotube",
    "nanochip",
    "kondo-core",
    "kondo-processor",
    "nanocrystaline-core",
    "nems",
    "volumetric-capacitor",
    "1d-photonic-crystal",
    "quantum-battery",
    "mqdc",
    "ingaas",
    "quantum-well",
    "plasmonic-core",
    "core-shell",
    "ns-material",
    "photon-deposited-quartz",
    "fdtd",
    "milfe",
    "mirror-mk04",
    "plastic-bar-02",
    -- Above recipes defined in another mod
}

--adding to module limitation list
py.allow_productivity(recipes_list)

local mod_cats = {
    "tree",
    "seaweed",
    "moss",
    "sap",
    "ulric",
    "sponge",
    "ralesia",
    "mukmoux",
    "tuuphra",
    "arthurian",
    "navens",
    "yotoi",
    "rennea",
    "dhilmos",
    "scrondrix",
    "phadai",
    "auog",
    "fish",
    "yaedols",
    "dingrits",
    "kmauts",
    "vonix",
    "grod",
    "phagnot",
    "bhoddos",
    "arqad",
    "xeno",
    "kicalk",
    "cridren",
    "antelope",
    "zipir",
    "trits",
    "arum",
    "vrauks",
    "xyhiphoe",
    "korlex",
    "fawogae",
    "moondrop",
    "cottongut",
    "guar"
}

-- MOUNTS

local allowed_equipment = {
    "active-defense-equipment",
    "battery-equipment",
    "belt-immunity-equipment",
    "energy-shield-equipment",
    "movement-bonus-equipment",
    "roboport-equipment"
}
for _, equipments in pairs(allowed_equipment) do
    for _, equipment in pairs(data.raw[equipments]) do
        if equipment.name ~= "ulric-infusion-equipment" then
            equipment.categories = equipment.categories or {}
            local contains = false
            for _, category in pairs(equipment.categories) do
                if category == "py-mount-generator" then
                    contains = true
                    break
                end
            end
            if not contains then
                table.insert(equipment.categories, "py-mount-generator")
            end
        end
    end
end
local disallowed_equipment = {"generator-equipment", "night-vision-equipment", "solar-panel-equipment"}
for _, equipments in pairs(disallowed_equipment) do
    for _, equipment in pairs(data.raw[equipments]) do
        local new_categories = {}
        for _, category in pairs(equipment.categories or {}) do
            if category ~= "py-mount-generator" then
                new_categories[#new_categories + 1] = category
            end
        end
        equipment.categories = new_categories
    end
end
data.raw["generator-equipment"]["py-mount-generator"].categories = {"py-mount-generator"}
