return {
	desc_get = "",
	name = "骑士之盾 +",
	init_effect = "",
	time = 0,
	color = "blue",
	picture = "",
	desc = "",
	stack = 1,
	id = 1005073,
	icon = 5070,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				buff_id = 1005071,
				target = "TargetSelf",
				time = 20
			}
		}
	}
}
