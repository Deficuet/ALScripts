return {
	init_effect = "",
	name = "",
	time = 0,
	color = "red",
	picture = "",
	desc = "",
	stack = 1,
	id = 61050,
	icon = 61050,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddAttr",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				attr = "dodgeRateExtra",
				number = -0.01
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onHPRatioUpdate"
			},
			arg_list = {
				hpUpperBound = 0.8,
				target = "TargetSelf",
				skill_id = 61050,
				quota = 1
			}
		},
		{
			type = "BattleBuffCancelBuff",
			trigger = {
				"onHPRatioUpdate"
			},
			arg_list = {
				count = 1,
				hpUpperBound = 0.8
			}
		}
	}
}
