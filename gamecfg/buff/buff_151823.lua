return {
	desc_get = "",
	name = "",
	init_effect = "",
	time = 3,
	color = "red",
	picture = "",
	desc = "",
	stack = 99,
	id = 151823,
	icon = 151820,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onAttach",
				"onStack"
			},
			arg_list = {
				skill_id = 151822,
				target = "TargetSelf"
			}
		},
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onAttach",
				"onStack"
			},
			pop = {},
			arg_list = {
				buff_id = 151825,
				target = "TargetSelf"
			}
		},
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onAttach",
				"onStack"
			},
			arg_list = {
				buff_id = 151826,
				target = "TargetSelf"
			}
		}
	}
}
