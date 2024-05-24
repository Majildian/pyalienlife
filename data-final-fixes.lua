local FUN = require('__pycoalprocessing__/prototypes/functions/functions')

if mods.pyalternativeenergy then -- used in turd upgrade zipir path 3
	local recipe = table.deepcopy(data.raw.recipe['zipir1-pyvoid'])
	recipe.name = 'zipir1-pyvoid-hatchery'
	recipe.icons = nil
	recipe.icon = '__pyhightechgraphics__/graphics/icons/rendering.png'
	recipe.icon_size = 32
	recipe.results = {{type = 'item', name = 'processed-ash', probability = 0.8, amount = 1}}
	data:extend {recipe}
end

--ADAPTATIONS

for _, drill in pairs(data.raw['mining-drill']) do
	if drill.module_specification then
		drill.allowed_effects = {'consumption', 'speed', 'productivity'}
	else
		drill.allowed_effects = {'consumption', 'productivity'}
	end
end

local recipes_list = {
	'adam42-gen-laser',
	'adam42-gen',
	'zipir-grow-01',
	'agar',
	'alien-enzymes',
	'alien-sample-02',
	'alien-sample-03',
	'antelope',
	'arthropod-blood-to-copper',
	'arthropod-blood-to-organic-solvent',
	'arthurian-food-01',
	'arthurian-food-02',
	'arthurian-grow-01',
	'arthurian',
	'artificial-blood',
	'auog-food-01-sawdust',
	'auog-food-01',
	'auog-food-02-sawdust',
	'auog-food-02',
	'auog',
	'bhoddos-sample',
	'bhoddos-to-ti',
	'bio-container',
	'biobattery',
	'biomass-1-a',
	'biomass-1',
	'biomass-2',
	'biopolymer-2',
	'blood-to-chlorine',
	'blood-to-iron',
	'blood-to-urea',
	'blood-to-zinc',
	'bones-to-phosphate',
	'brain-guts-to-zinc',
	'brain-to-zinc',
	'cadaveric-arum-sample',
	'cadaveric-to-copper',
	'cadaveric-to-sulfur',
	'cage',
	'carapace-to-al',
	'carapace-to-re',
	'cdna',
	'cellulose-00',
	'cellulose-02',
	'cellulose-gasification',
	'chithin-to-phosphate',
	'cobalt-extract',
	'cobalt-fluoride',
	'cobalt-nx',
	'cobalt-oxide',
	'cobalt-sulfate-02',
	'cobalt-sulfate',
	'coke-co2',
	'concrete-02',
	'cooling-system',
	'cottongut-food-01',
	'cottongut-food-02',
	'cottongut-food-03',
	'cridren-sample',
	'cridren-seeds-to-mo',
	'cysteine',
	'cytostatics',
	'decalin',
	'dhilmos-food-01',
	'dhilmos-food-02',
	'dhilmos-grow-01',
	'dhilmos',
	'dingrits-food-01',
	'dingrits-food-02',
	'dna-polymerase-2',
	'dna-polymerase',
	'dried-grods-02',
	'dried-grods',
	'dynemicin',
	'earth-antelope-sample',
	'earth-bear-sample',
	'earth-cow-sample',
	'earth-crustacean-sample',
	'earth-flower-sample',
	'earth-generic-sample',
	'earth-giraffe-sample',
	'earth-horse-sample',
	'earth-jute-sample',
	'earth-lizard-sample',
	'earth-palmtree-sample',
	'earth-potato-sample',
	'earth-roadrunner-sample',
	'earth-sea-sponge-sample',
	'earth-sunflower-sample',
	'earth-tiger-sample',
	'earth-tropical-tree-sample',
	'earth-venus-fly-sample',
	'earth-wolf-sample',
	'empty-planter-box',
	'empty-neuromorphic-chip',
	'enediyne',
	'energy-drink',
	'energy-drinkb',
	'enzyme-pks',
	'enzyme-pks-nickel-carbonyl',
	'ethanol-combustion',
	'ethanol',
	'ethylene-from-fruit',
	'fawogae-spore',
	'fawogae-to-iron',
	'fawogae-to-sulfur',
	'fertilizer-1',
	'fertilizer-3',
	'fertilizer-4',
	'fetal-serum-01',
	'fiber-01',
	'fiber-dry-storage',
	'filtration-media-3',
	'filtration-media-4',
	'fish-food-01',
	'fish-food-02',
	'fish-oil-combustion',
	'fish-oil',
	'fish-to-iron',
	'fish-to-phosphate',
	'fish-to-tin',
	'flavonoids',
	'flutec-pp6',
	'formamide',
	'formic-acid',
	'gas-bladder-to-natura-gas',
	'gasoline-cellulose',
	'grod-sample',
	'grod-to-tin',
	'grod-to-zinc',
	'gta',
	'guts-to-chlorine',
	'guts-to-copper',
	'guts-to-zinc',
	'hcl-from-guts',
	'hyaline',
	'immunosupressants',
	'kicalk-fiber',
	'kicalk-sample',
	'kicalk-to-iron',
	'kmauts-ration-chitin',
	'korlex-food-01',
	'korlex-food-02',
	'lab-instrument-2',
	'lard-combustion',
	'lard-from-brains',
	'latex-slab',
	'latex',
	'lignin-to-aromatics',
	'lignin',
	'lime-from-shell',
	'liquid-manure',
	'log-wood-fast',
	'manure-bacteria-fish',
	'manure-bacteria',
	'manure-to-biomass',
	'manure-to-crude',
	'manure-to-nitrogen',
	'meat-and-gut-to-copper',
	'meat-to-chromium',
	'meat-to-copper',
	'meat-to-cyanic',
	'meat-to-iron',
	'meat-to-nitrogen',
	'meat-to-phosphate',
	'meat-to-tin',
	'methane-from-liquid-manure',
	'microcin-j25',
	'mixed-ores',
	'mmp',
	'mosfet',
	'moss-gen',
	'mukmoux-food-01',
	'mukmoux-food-02',
	'mukmoux',
	'nano-cellulose',
	'naven-coal',
	'navens-sample',
	'navens-spore',
	'navens-to-ti',
	'navens-to-tin',
	'neuromorphic-chip',
	'neuroprocessor',
	'nitrogen-mustard',
	'olechemicals-from-skin',
	'oleochemical-combustion',
	'oleochemicals-3',
	'organics-from-wood-2',
	'pacifastin',
	'paper-towel',
	'pelt-processing',
	'peptidase-m58',
	'petri-dish',
	'phadai-food-01',
	'phadai-food-02',
	'phadai',
	'phagnot-food-01',
	'phagnot-food-02',
	'phenol-02',
	'phenol-3',
	'pheromones',
	'planter-box',
	'plasmids',
	'primers',
	'primers-02',
	'primers-03',
	'propeptides',
	'purine-analogues',
	'py-science-pack-1-turd',
	'py-science-pack-1',
	'py-science-pack-2-turd',
	'py-science-pack-2',
	'py-science-pack-3-turd',
	'py-science-pack-3',
	'py-science-pack-4-turd',
	'py-science-pack-4',
	'ralesia-sample',
	'ralesia-seeds-paper-towel',
	'recombinant-ery-2',
	'recombinant-ery-3',
	'recombinant-ery',
	'rennea-sample',
	'rennea-seeds',
	'rennea-to-copper',
	'rennea-to-phosphate',
	'replicator-bioreserve',
	'replicator-ralesia',
	'replicator-rennea',
	'replicator-tuuphra',
	'replicator-yotoi-fruit',
	'replicator-yotoi',
	'retrovirus-2',
	'retrovirus',
	'scrondrix',
	'sea-sponge-processing-01',
	'sea-sponge-sprouts-2',
	'sea-sponge-sprouts-3',
	'sea-sponge-sprouts-4',
	'sea-sponge-sprouts-processing-01',
	'sea-sponge-sprouts',
	'sea-sponge',
	'simik-food-01',
	'simik-food-02',
	'sodium-alginate',
	'soil-separation-2',
	'spikes-to-mo',
	'stopper',
	'sugar',
	'sweet-syrup',
	'syrup-01',
	'tuupha-to-iron',
	'tuuphra-sample',
	'tuuphra-seeds',
	'tuuphra-to-copper',
	'tuuphra-to-mo',
	'ulric-food-01',
	'ulric-food-02',
	'ulric',
	'urea-from-liquid-manure',
	'vrauks-food-01',
	'vrauks-food-02',
	'vrauks',
	'wood-seedling',
	'wood-seeds-to-phosphate',
	'wood-seeds',
	'workers-food-02',
	'workers-food-03',
	'workers-food',
	'yaedol-to-sulfur',
	'yaedols-sample',
	'yaedols-spores',
	'yaedols-to-copper',
	'yotoi-cellulose',
	'yotoi-fruit-to-chromium',
	'yotoi-fruit-to-tin',
	'yotoi-leaves-to-chromium',
	'yotoi-leaves',
	'yotoi-sample',
	'yotoi-seed-to-chromium',
	'yotoi-seeds-cold',
	'yotoi-seeds',
	'zinc-finger-proteins',
	'zipir-food-01',
	'zipir-food-02',
	'zogna-bacteria-darkness',
	'zogna-bacteria',
	'zymogens',

	"deposited-core",
	"biofilm-pyht",
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
	"metallic-glass",
	"nanochondria",
	"magnetic-beads",
	"cottongut-science-blue-seeds",
	"cottongut-science-blue-seeds-80-20",
	"cottongut-science-prod-seeds",
	"cottongut-science-prod-seeds-80-20",
	"antitumor",
	"antitumor-2",
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
	'guano-explosives'
}

--adding to module limitation list
FUN.productivity(recipes_list)

local mod_cats = {
	'tree',
	'seaweed',
	'moss',
	'sap',
	'ulric',
	'sponge',
	'ralesia',
	'mukmoux',
	'tuuphra',
	'arthurian',
	'navens',
	'yotoi',
	'rennea',
	'dhilmos',
	'scrondrix',
	'phadai',
	'auog',
	'fish',
	'yaedols',
	'dingrits',
	'kmauts',
	'vonix',
	'grod',
	'phagnot',
	'bhoddos',
	'arqad',
	'xeno',
	'kicalk',
	'cridren',
	'antelope',
	'zipir',
	'trits',
	'arum',
	'vrauks',
	'xyhiphoe',
	'korlex',
	'fawogae',
	'moondrop',
	'cottongut',
	'guar'
}

-- MOUNTS

local allowed_equipment = {
	'active-defense-equipment',
	'battery-equipment',
	'belt-immunity-equipment',
	'energy-shield-equipment',
	'movement-bonus-equipment',
	'roboport-equipment'
}
for _, equipments in pairs(allowed_equipment) do
	for _, equipment in pairs(data.raw[equipments]) do
		if equipment.name ~= 'ulric-infusion-equipment' then
			equipment.categories = equipment.categories or {}
			local contains = false
			for _, category in pairs(equipment.categories) do
				if category == 'py-mount-generator' then
					contains = true
					break
				end
			end
			if not contains then
				table.insert(equipment.categories, 'py-mount-generator')
			end
		end
	end
end
local disallowed_equipment = {'generator-equipment', 'night-vision-equipment', 'solar-panel-equipment'}
for _, equipments in pairs(disallowed_equipment) do
	for _, equipment in pairs(data.raw[equipments]) do
		local new_categories = {}
		for _, category in pairs(equipment.categories or {}) do
			if category ~= 'py-mount-generator' then
				new_categories[#new_categories + 1] = category
			end
		end
		equipment.categories = new_categories
	end
end
data.raw['generator-equipment']['py-mount-generator'].categories = {'py-mount-generator'}

-- END MOUNTS

--[[ recipe name finder
local recipe_names = {}

for r, recipe in pairs(data.raw.recipe) do
	if recipe.category == "nano" then
		table.insert(recipe_names, recipe.name)
	end
end

log(serpent.block(recipe_names))
]]--