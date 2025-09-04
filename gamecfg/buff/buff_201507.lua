return {
	time = 20.1,
	name = "2025信标BOSS 夕立meta 锁定爪击点燃",
	init_effect = "",
	stack = 1,
	id = 201507,
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
				time = 2,
				cloakExpose = 36,
				number = 100,
				dotType = 1,
				k = 1
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
