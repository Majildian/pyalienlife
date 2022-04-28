local fun = require("prototypes/functions/functions")

fun.autorecipes {
    name = 'xyhiphoe-improve',
	category = 'creature-chamber',
	--module_limitations = 'xyhiphoe',
	subgroup = 'py-alienlife-xyhiphoe',
	order = 'b',
	--main_product = "xyhiphoe",
    mats =
	{
		--rna anabolic
		{
			ingredients =
				{
					{name='anabolic-rna', amount =1},
                    {name='xyhiphoe', amount = 1},
				},
			results =
				{
					{name='meat-xyhiphoe', amount = 1},
				},
			crafting_speed = 90,
			tech = 'anabolic-rna'
		},
		--rna anabolic and gh
		{
			ingredients =
				{
					--{name='nanochondria', amount =1},
					{name='gh', amount =1},
				},
			results =
				{

				},
			crafting_speed = 30,
			tech = 'anabolic-rna'
		},
		--antitumor
		{
			ingredients =
				{
					{name='gh',remove_item = true},
					{name='anabolic-rna',remove_item = true},
					{name='antitumor', amount =1},
				},
			results =
				{
					{name='meat-xyhiphoe', remove_item = true},
					{name='guts-xyhiphoe', amount = 1},
				},
			crafting_speed = 90,
			tech = 'antitumor'
		},
		--antitumor and gh
		{
			ingredients =
				{
					--{name='nanochondria', amount =1},
					{name='gh', amount =1},
				},
			results =
				{

				},
			crafting_speed = 30,
			tech = 'antitumor'
		},
		--Recombinant Ery
		{
			ingredients =
				{
					{name='gh',remove_item = true},
					{name='antitumor',remove_item = true},
					{name='recombinant-ery', amount =1},
				},
			results =
				{
					{name='guts-xyhiphoe', remove_item = true},
					{name='blood-xyhiphoe', amount = 1},
				},
			crafting_speed = 90,
			tech = 'recombinant-ery'
		},
		--Recombinant Ery and gh
		{
			ingredients =
				{
					{name='gh', amount =1},
				},
			results =
				{

				},
			crafting_speed = 30,
			tech = 'recombinant-ery'
		},
	}
}