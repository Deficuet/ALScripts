pg = pg or {}
pg.child2_resource = {
	{
		default_value = 50,
		name = "Funds",
		icon = "res_jinqian",
		type = 1,
		max_value = 99999,
		min_value = 0,
		desc = "Money that is used in all sorts of scenarios in Project Identity.",
		character = 1,
		id = 1,
		item_icon = "res_jinqian2"
	},
	{
		default_value = 50,
		name = "Mood",
		icon = "res_xinqing",
		type = 2,
		max_value = 100,
		min_value = 0,
		desc = "$1\nMood affects how many stats and Funds you get.\n0 - 19: Depressed - 40% less Funds\n20 to 39: Sad - 20% less Funds\n40 to 59: Normal - No effect\n60 to 100: Happy - 40% more Funds",
		character = 1,
		id = 2,
		item_icon = "res_xinqing2"
	},
	{
		default_value = 3,
		name = "Action points",
		icon = "res_xingdongli",
		type = 3,
		max_value = 3,
		min_value = 0,
		desc = "Used for going outside. Automatically recovers every turn.",
		character = 1,
		id = 3,
		item_icon = "res_xingdongli2"
	},
	{
		default_value = 50,
		name = "Affection",
		icon = "res_haogandu",
		type = 4,
		max_value = 500,
		min_value = 0,
		desc = "Having main screen conversations can increase your Affection.\nYou can get rewards from increasing your Affection as well.",
		character = 1,
		id = 4,
		item_icon = "res_haogandu2"
	},
	get_id_list_by_character = {
		{
			1,
			2,
			3,
			4
		}
	},
	all = {
		1,
		2,
		3,
		4
	}
}
