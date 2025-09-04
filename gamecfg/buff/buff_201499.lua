return {
	time = 6.1,
	name = "2025信标BOSS 夕立meta 鱼雷附带点燃",
	init_effect = "",
	stack = 1,
	id = 201499,
	picture = "",
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffDOT",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				attr = "torpedoPower",
				exposeGroup = 1,
				time = 1,
				cloakExpose = 36,
				number = 20,
				dotType = 1,
				k = 0.3
			}
		},
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onAttach"
			},
			arg_list = {
				buff_id = 201508
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onRemove"
			},
			arg_list = {
				skill_id = 201507
			}
		}
	}
}
