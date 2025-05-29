return {
	init_effect = "",
	name = "",
	time = 10,
	color = "red",
	picture = "",
	stack = 1,
	id = 801713,
	icon = 801710,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onRemove"
			},
			arg_list = {
				buff_id = 801718,
				target = "TargetSelf"
			}
		}
	}
}
