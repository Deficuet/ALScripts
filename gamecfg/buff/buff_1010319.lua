return {
	init_effect = "",
	name = "",
	time = 0,
	picture = "",
	desc = "",
	stack = 1,
	id = 1010319,
	icon = 10310,
	last_effect = "yanzhan_buff",
	effect_list = {
		{
			type = "BattleBuffAddTag",
			trigger = {
				"onAttach"
			},
			arg_list = {
				tag = "WarspiteSP"
			}
		}
	}
}
