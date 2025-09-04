return {
	time = 0,
	name = "2025信标BOSS 夕立meta 被夕立锁定的角色",
	init_effect = "",
	stack = 1,
	id = 201503,
	picture = "",
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddTag",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				tag = "Xili_Lock"
			}
		}
	}
}
