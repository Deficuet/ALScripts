return {
	time = 0.5,
	name = "2026尼尔联动 近身斩击期间本体无敌",
	init_effect = "",
	stack = 1,
	id = 201808,
	picture = "",
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onRemove"
			},
			arg_list = {
				buff_id = 201809
			}
		}
	}
}
